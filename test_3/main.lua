function love.load()
    anim8 = require('libraries/anim8')
    love.graphics.setDefaultFilter('nearest','nearest')
    screenX = love.graphics.getWidth()
    screenY = love.graphics.getHeight()
    player = {}
    player.x = screenX/2;
    player.y = screenY/2;
    player.w = 50;
    player.h = 50;
    player.spriteSheet = love.graphics.newImage('sprites/16.png');
    player.grid = anim8.newGrid(16,16,player.spriteSheet:getWidth(),player.spriteSheet:getHeight());
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-6',1), 0.15)
    player.animations.left = anim8.newAnimation(player.grid('1-6',2), 0.15)
    player.animations.right = anim8.newAnimation(player.grid('1-6',3), 0.15)
    player.animations.up = anim8.newAnimation(player.grid('1-6',4), 0.15)
    player.currentAnimation = player.animations.left
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown('down') or love.keyboard.isDown('s') then
        player.y = player.y + 1.5
        player.currentAnimation = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
        player.x = player.x + 1.5
        player.currentAnimation = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown('up') or love.keyboard.isDown('w') then
        player.y = player.y - 1.5
        player.currentAnimation = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then
        player.x = player.x - 1.5
        player.currentAnimation = player.animations.left
        isMoving = true
    end

    if isMoving == false then
        player.currentAnimation:gotoFrame(1)
    end

    player.currentAnimation:update(dt)

end

function love.draw()
    love.graphics.setColor(109/255,170/255,44/255,1)
    love.window.setTitle('Ricky - Day 3')
    love.graphics.rectangle('fill', 0, 0, screenX,screenY)
    love.graphics.setColor(1,1,1,1)
    player.currentAnimation:draw(player.spriteSheet,player.x,player.y,nil,5,5)
end
