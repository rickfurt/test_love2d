-- Load some default values for our rectangle.
function love.load()
    love.window.setMode(800, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})
    sky = love.graphics.newImage("sky.png")
    hill = love.graphics.newImage("layers/hill.png")
    screen_height = love.graphics.getHeight()
    screen_width = love.graphics.getWidth()
    mountains = love.graphics.newImage("layers/far_mountains.png")
    clouds = love.graphics.newImage("layers/clouds_front.png")
    cloudX1 = 380;
    cloudX2 = 380*2;
    cloudX3 = 380*3;
    cloudX4 = 380*4;
    sunPositionY = screen_height - 100
    sunPositionX = 50
    toTheLeft = 0
end

function love.update(dt)
    cloudX1 = cloudX1 -0.05
    cloudX2 = cloudX2 -0.05
    cloudX3 = cloudX3 -0.05
    cloudX4 = cloudX4 -0.05
    toTheLeft = toTheLeft + 0.01
    sunPositionY = sunPositionY - 0.02
    sunPositionX = sunPositionX + 0.02
end

function love.draw()
    love.window.setTitle("Ricky - Day 1")
    love.graphics.draw(sky, 0, 0,0,2.2,3.2)
    love.graphics.draw(clouds, cloudX1, 215,math.pi/1)
    love.graphics.draw(clouds, cloudX2, 215,math.pi/1)
    love.graphics.draw(clouds, cloudX3, 215,math.pi/1)
    love.graphics.draw(clouds, cloudX4, 215,math.pi/1)
    love.graphics.circle("fill",sunPositionX, sunPositionY,50)
    love.graphics.draw(mountains, 0 - toTheLeft, screen_height - 300,0,2.2,2.2)
    love.graphics.draw(mountains, screen_width - toTheLeft, screen_height - 300,0,2.2,2.2)
    love.graphics.draw(hill, 0 - toTheLeft *4, screen_height - 215)
    love.graphics.draw(hill, screen_width/2 - toTheLeft * 4, screen_height - 215)
    love.graphics.draw(hill, screen_width - toTheLeft*4, screen_height - 215)
end