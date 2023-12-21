-- scripts/speed-adjust.lua
local mp = require 'mp'

function adjust_speed()
    local speed = mp.get_property_number('speed')
    local new_speed = math.floor(speed / 0.5) * 0.5
    mp.set_property_number('speed', new_speed)
end

mp.register_script_message('speed-adjust', adjust_speed)

