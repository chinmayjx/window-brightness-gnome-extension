/* extension.js
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

/* exported init */


const OVERLAY_NAME = "brightness_overlay";
const SLIDER_NAME = "brightness_slider";

const { Clutter, St } = imports.gi

const ExtensionUtils = imports.misc.extensionUtils;
const Main = imports.ui.main;
const Meta = imports.gi.Meta;
const Shell = imports.gi.Shell;

class Extension {
    constructor(uuid) {
        this.uuid = uuid;
    }
    onToggle(action) {
        let settings = ExtensionUtils.getSettings("org.gnome.shell.extensions.cj.window.brightness");
        Main.wm.addKeybinding("dim", settings, Meta.KeyBindingFlags.IGNORE_AUTOREPEAT,
            Shell.ActionMode.NORMAL | Shell.ActionMode.OVERVIEW, action.bind(this));
    }
    toggleAction() {
        log("dim")
        this.focusedWindow = global.display.get_focus_window();
        this.windowRect = this.focusedWindow.get_frame_rect();
        this.windowActor = this.focusedWindow.get_compositor_private();
        let slider = this.windowHasSlider();
        if (slider) {
            slider.get_parent().destroy();
        }
        else {
            let overlay = this.insertOverlay();
            let slider = this.insertSlider(overlay);
            this.bindSlider(slider, overlay);
        }
    }
    windowHasSlider() {
        for (let child of this.windowActor.get_children()) {
            if (child.name === SLIDER_NAME) {
                return child.first_child;
            }
        }
    }
    insertSlider(overlay) {
        let sliderContainer = new St.Bin({ name: SLIDER_NAME, reactive: true, style: "background-color: #000000; padding: 10px 15px; border-radius: 5px;", width: 200, x: this.windowActor.width / 2 - 100, y: this.windowRect.y - this.windowActor.y + this.windowRect.height - 50 })
        let slider = new imports.ui.slider.Slider(1 - overlay.get_background_color().alpha / 255);
        sliderContainer.set_child(slider);
        this.windowActor.add_child(sliderContainer);

        this.windowActor.connect("notify::size", () => {
            this.windowRect = this.focusedWindow.get_frame_rect();
            sliderContainer.set_position(this.windowActor.width / 2 - 100, this.windowRect.y - this.windowActor.y + this.windowRect.height - 50)
        })
        return slider;
    }
    insertOverlay() {
        for (let child of this.windowActor.get_children()) {
            if (child.name === OVERLAY_NAME) {
                return child;
            }
        }
        let overlay = new Clutter.Actor({ name: OVERLAY_NAME, background_color: Clutter.Color.new(0, 0, 0, 0), width: this.windowRect.width, height: this.windowRect.height, x: this.windowRect.x - this.windowActor.x, y: this.windowRect.y - this.windowActor.y });
        this.windowActor.add_child(overlay);

        this.windowActor.connect("notify::size", () => {
            this.windowRect = this.focusedWindow.get_frame_rect();
            overlay.set_width(this.windowRect.width);
            overlay.set_height(this.windowRect.height);
            overlay.set_position(this.windowRect.x - this.windowActor.x, this.windowRect.y - this.windowActor.y)
        })
        return overlay;
    }
    bindSlider(slider, overlay) {
        slider.connect("notify::value", () => {
            overlay.set_background_color(Clutter.Color.new(0, 0, 0, (1 - slider.value) * 255));
        })
    }
    enable() {
        log(this.uuid)
        this.onToggle(this.toggleAction)
    }

    disable() {
    }
}

function init(meta) {
    return new Extension(meta.uuid);
}
