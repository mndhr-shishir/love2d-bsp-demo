Object = require 'classic/classic'
local Node = require 'Node'

function love.load()
    math.randomseed(os.time())

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    node = Node(0, 0, w, h)
    min_size = 128
    node:partition(min_size)
end

function love.keypressed(key, isrepeat)
    if key == "r" then
        node:partition(min_size)
    end
end


function love.update(dt)
end

function love.draw()
    node:draw()
end
