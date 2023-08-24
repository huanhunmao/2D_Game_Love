-- Variables
-- message = 666
-- ppx = 'good ppx' 
-- -- isStudent = false  布尔值

-- message = 666 - 100 



-- function love.draw()
--     love.graphics.setFont(love.graphics.newFont(50))
--     -- love.graphics.print(goodVar)

--     -- if
--     condition  = 2 
--     if condition == 1 then 
--         love.graphics.print(condition)
--     end 

--     if condition == 2 then
--         love.graphics.print(condition)
--     end 

--     -- if else 
--     age = 2 
--     if age < 18 then 
--         love.graphics.print('too young')
--     elseif age > 18 and age < 60 then
--         love.graphics.print('good')
--     else 
--         love.graphics.print('old')
--     end 
-- end


-- while
-- message  = 0 
-- test = 0
-- while message < 100 do 
--     message = message + 1 
--     test = test - 5 
-- end


-- -- for 
-- package = 0
-- -- 变量 i 从1开始，每次递增1，直到达到3为止。这表示循环将执行3次
-- for i= 1,3,1 do 
--     package = package + 10
-- end

-- function  
-- 带参数 / 不带参数的 
value = 100
-- function doubleVar(var)
--     return var * 2 
-- end

-- value = doubleVar(value)

-- -- function 闭包
-- function createCounter()
--      count = 0
--      return function()
--         count = count + 1
--         while count < 100 do 
--             return count
--         end

--         if count >= 100 then
--             count = 100 
--             return count
--         end
--      end
--     end

-- counter = createCounter()


--  local
-- function localVar()
--     local localVarValue = 101 
--     return localVarValue
-- end

-- 表 Tabel 
function love.draw()
    -- love.graphics.setFont(love.graphics.newFont(50))

    -- 1 基本 Table
    local person  = {
        name = 'Alice',
        age = 25,
        isStudent = true,
    }

    -- love.graphics.print(person.name) -- Alice 25 可打印  / 但打印 isStudent会 error ！


    -- 2 访问索引 
    local fruits = {"apple", "orange", "banana"}
    -- love.graphics.print(fruits[1]) --  apple 索引从 1 开始的 ！


    -- 3 遍历    pairs--无序遍历     ipairs--有序遍历
    -- for key, value in pairs(person) do
    --     love.graphics.print(key, value)
    -- end 

    local yOffset = 50  -- 用于在垂直方向上定位绘制文本的位置

    for index,fruit in ipairs(fruits) do
        -- love.graphics.print(index, fruit)
        love.graphics.print(index .. ": " .. tostring(fruit), 50, yOffset)
        yOffset = yOffset + 20  -- 调整下一行的垂直位置
    end
end