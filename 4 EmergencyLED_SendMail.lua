-- Special thanks to andre@andregarzia.com
-- #4 Emergency LED - Send Mail

pin = 1
gpio.mode(pin, gpio.OUTPUT)

function turnOn()
    gpio.write(pin, gpio.HIGH)
end

function turnOff()
    gpio.write(pin, gpio.LOW)
end 

function sendMail()
    local para = "anahelenarp@hotmail.com"
    local quando = tmr.now()
    local url = "http://www.anascoding.com.br/mailer/mailer.php?to=" .. para .. "&time=" .. quando

    http.get(url, nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)
end

function activateSensor()
    local timer = tmr.create()

    timer:register(1000, tmr.ALARM_AUTO, function(t) 
        local value = adc.read(0)
        print("light: " .. value)

        if (value < 920) then
            turnOn()
            sendMail()
        else
            turnOff()
        end
    end)

    timer:start()
end