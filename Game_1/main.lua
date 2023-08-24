function love.load()
   target = {}
   target.x = 300
   target.y = 300
--    半径
   target.radius = 50

--    设置目标分数 限制时间
   score = 0
   timer = 0

   gameFont = love.graphics.newFont(40)

--    图片替换 
    sprites = {}
    sprites.sky = love.graphics.newImage('sprites/sky.png')
    sprites.crosshairs = love.graphics.newImage('sprites/crosshairs.png')
    sprites.target = love.graphics.newImage('sprites/target.png')

    -- 添加一个是否可以玩游戏的状态  1-> 不能玩   2-> 可以玩
    gameState = 1

    -- 隐藏鼠标箭头
    love.mouse.setVisible(false)
end

function love.update(dt)
    if timer > 0 then
        -- 在每一帧中，timer 的值会减去 dt，模拟计时的流逝。当 timer 小于 0 时，它会被设为 0，以避免负数值
        timer = timer - dt
    end

    if timer < 0 then 
        timer = 0
        gameState = 1
    end
end

function love.draw()
    -- 画背景图 
    love.graphics.draw(sprites.sky)
    -- --  将一个 矩形 放在  特定 位置 
    -- love.graphics.setColor(0,1,0)
    -- love.graphics.rectangle('fill',200, 250, 200, 100)

    -- -- 将一个 圆形 放在特定 位置 
    -- love.graphics.setColor(204/255,102/255,255/255)
    -- love.graphics.circle('fill',300,200,100)

    -- love.graphics.setColor(1,0,0)
    -- love.graphics.circle('fill',target.x, target.y, target.radius)

    -- 目标分数相关属性
    love.graphics.setColor(1,1,1)
    love.graphics.setFont(gameFont)
    -- 优化展示
    love.graphics.print('Score: ' .. score, 5, 5)
    love.graphics.print("Timer: " .. math.ceil(timer),300, 5)

    -- 展示未 玩游戏前的提示 
    if gameState == 1 then 
        love.graphics.printf('Click anywhere to begin game!', 0, 250, love.graphics.getWidth(),"center")
    end

    if gameState == 2 then
    -- 画目标和鼠标
        -- 为了 对齐 图像的中心就会与鼠标光标的中心 需要 减去 一半 尺寸
        love.graphics.draw(sprites.target, target.x - target.radius , target.y - target.radius)
    end
    love.graphics.draw(sprites.crosshairs, love.mouse.getX(x) - 20, love.mouse.getY(y) - 20)
end


function love.mousepressed( x, y, button, istouch, presses )
    -- 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button
    if button == 1 and gameState == 2 then
        local mouseInTarget = distanceBetween(x,y, target.x, target.y)
        -- 鼠标点和圆心的距离 小于半径表示 点击在这个圆内
        if mouseInTarget < target.radius then
            score = score + 1
            -- 考虑到 不碰边界问题（只需要 大于 半径）
            target.x  = math.random(target.radius,love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius,love.graphics.getHeight() - target.radius)
        end
    elseif button == 1 and gameState == 1 then
            gameState = 2
            timer = 10
            score = 0
    end
end

-- 计算 鼠标点击是否在 target 内 
function distanceBetween(x1,y1,x2,y2)
    -- 计算的公式是两点间距离的公式，即 √((x1 - x2)^2 + (y1 - y2)^2)。
    -- 其中 (x1 - x2)^2 表示横坐标的差的平方，(y1 - y2)^2 表    示纵坐标的差的平方，两者相加后再开平方就得到了两点之间的距离
    return math.sqrt((x1-x2)^2 + (y1-y2)^2)
end