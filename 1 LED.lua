-- Special thanks to andre@andregarzia.com
-- #1: Light up a LED
--
-- LED => D1

pin = 1
gpio.mode(pin, gpio.OUTPUT)

function turnOn()
    gpio.write(pin, gpio.HIGH)
end

function turnOff()
    gpio.write(pin, gpio.LOW)
end 

-- 1 sec
function blinkLED()
    local timer = tmr.create()
    local isOn = true

    timer:register(1000, tmr.ALARM_SINGLE, function(t) 
        gpio.write(pin, isOn and gpio.HIGH or gpio.LOW)
        isOn = not isOn
    end)

    timer:start()
end