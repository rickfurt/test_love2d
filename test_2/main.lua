-- Load some default values for our rectangle.
function love.load()
    startTime = love.timer.getTime()
    love.window.setMode(400, 600, {resizable=true, vsync=0, minwidth=400, minheight=300})
    -- Load bar images
    barLeft = love.graphics.newImage('barBlue_horizontalLeft.png')
    barMiddle = love.graphics.newImage('barBlue_horizontalBlue.png')
    barRight = love.graphics.newImage('barBlue_horizontalRight.png')

    screen_height = love.graphics.getHeight()
    screen_width = love.graphics.getWidth()
    font = love.graphics.newFont( 'font.ttf', 20 )
    love.graphics.setFont(font)
    background = {
        x = 0,
        y = 0,
        width = screen_width,
        height = screen_height
    }
    topbar ={
        x = 0,
        y = 0,
        width = screen_width,
        height = 50
    }
    first_row ={
        x = 0,
        y = 55,
        width = screen_width,
        height = 100
    }
    progress = {
        x = 75,
        y = 65,
        width = screen_width*0.75,
        height = 80
    }
    dollarsPerIteration = 0.3
    clicks = 0
    timer = 0
    cash = 0
end

function love.update(dt)
    screen_height = love.graphics.getHeight()
    screen_width = love.graphics.getWidth()
    background.width = screen_width
    background.height = screen_height
    topbar.width = screen_width
    local currentTime = love.timer.getTime()
    timer = math.floor(currentTime - startTime)
    --if progress.width * (clicks/progress.width) >= progress.width then
    --    clicks = 0
    --    cash = cash + dollarsPerIteration;
    --    dollarsPerIteration = dollarsPerIteration + dollarsPerIteration* 1.05
    --else
    --    clicks = clicks + 0.1
    --end


end

function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        -- Code to execute when left mouse button is clicked
        --if x > first_row.x+35 and x < first_row.x+35+25 then
        if progress.width * (clicks/progress.width) >= progress.width then
            clicks = 0
            cash = cash + dollarsPerIteration;
            dollarsPerIteration = dollarsPerIteration + dollarsPerIteration* 1.05
        else
           clicks = clicks + 20
        end
    end
end



function love.draw()
    love.window.setTitle("Ricky - Day 2")
    -- Background
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle('fill',background.x,background.y,background.width,background.height)
    -- TOP BAR
    love.graphics.setColor(0,0,0,1)
    love.graphics.rectangle('fill',topbar.x,topbar.y,topbar.width,topbar.height)
    love.graphics.setColor(1,1,1,1)
    love.graphics.print(timer .. 's', 10 ,15 )
    love.graphics.print('$'.. string.format("%.2f",cash), screen_width *0.8 ,15 )
    -- First row
    love.graphics.setColor(0,0.5,0,1)
    love.graphics.rectangle('fill',first_row.x,first_row.y,first_row.width,first_row.height)
    -- circle within first_row
    love.graphics.setColor(1,1,1,1)
    love.graphics.circle('fill',first_row.x+35, first_row.y+40, 25)
    ---- number of clicks
    love.graphics.setColor(0,0,0,1)
    love.graphics.print('$'.. string.format("%.1f", dollarsPerIteration), first_row.x + 10 , first_row.y+30 )
    -- Progress bar outline
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle('line',progress.x,progress.y,progress.width,progress.height)
    -- Progress bar content
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle(
            'fill',
            progress.x,
            progress.y,
            progress.width * (clicks/progress.width),
            progress.height
    )



end