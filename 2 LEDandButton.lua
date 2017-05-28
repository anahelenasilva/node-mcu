-- Special thanks to andre@andregarzia.com
-- #2 Turning LED on and off using a button

led_pin = 1
button_pin = 2

gpio.mode(led_pin, gpio.OUTPUT)

function turnOn()
    gpio.write(led_pin, gpio.HIGH)
end

function turnOff()
    gpio.write(led_pin, gpio.LOW)
end 

--callback function => called when the button is pressed
function callback_button(level, when)
    print("callback: " .. level .. " when: " .. when)
    if (level == 1) then
        turnOn()
    else
        turnOff()
    end
    
    gpio.trig(button_pin, level == gpio.HIGH  and "down" or "up")
end

gpio.trig(button_pin, "down", callback_button)