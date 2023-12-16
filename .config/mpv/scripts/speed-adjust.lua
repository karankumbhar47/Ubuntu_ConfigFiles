-- scripts/speed-adjust.lua
local mp = require 'mp'

function adjust_speed(delta)
    local speed = mp.get_property_number('speed')
    local new_speed = math.floor(speed / delta) * delta
    mp.set_property_number('speed', new_speed)
end

mp.register_script_message('speed-adjust', adjust_speed)

