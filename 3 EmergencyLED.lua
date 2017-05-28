-- Special thanks to andre@andregarzia.com
-- #3 Emergency LED
-- Turn LED on or off based on proximity sensor

pin = 1
gpio.mode(pin, gpio.OUTPUT)

function turnOn()
    gpio.write(pin, gpio.HIGH)
end

function turnOff()
    gpio.write(pin, gpio.LOW)
end 

function activate_sensor()
    local timer = tmr.create()

    timer:register(1000, tmr.ALARM_AUTO, function(t) 
        local value = adc.read(0)
        print("light: " .. value)

        if (value < 920) then
            turnOn()
        else
            turnOff()
        end
    end)

    timer:start()
end