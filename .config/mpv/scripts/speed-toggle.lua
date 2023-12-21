-- scripts/speed-toggle.lua
local mp = require 'mp'

local previous_speed
local is_space_pressed = false

function toggle_speed()
    if is_space_pressed then
        local current_speed = mp.get_property_number('speed')
        if current_speed ~= 2.0 then
            previous_speed = current_speed
            mp.set_property_number('speed', 2.0)
        else
            mp.set_property_number('speed', previous_speed or 1.0)
        end
    end
end

function on_key_event(name, event)
    if name == 'SPACE' then
        is_space_pressed = event == 'down'
        toggle_speed()
    end
end

mp.add_key_binding(nil, 'toggle_speed', toggle_speed)
mp.register_event('keydown', on_key_event)
mp.register_event('keyup', on_key_event)

mp.register_event('end-file', function()
    previous_speed = nil
end)

