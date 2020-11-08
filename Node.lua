local Node = Object:extend()

function Node:new(x, y, w, h)
    self.x, self.y, self.width, self.height = x, y, w, h

    -- Binary tree, so only two children
    self.left = nil
    self.right = nil

    -- Appearance
    self.color = {}
end

function Node:partition(min_size)
    local max_w, max_h = self.width, self.height
    local act_size = min_size * 2
    local act_size = min_size * 2

    if max_w <= act_size and max_h <= act_size then
        -- Set a random color for each partition at start
        self.color = { math.random(), math.random(), math.random() }
        return
    end

    if max_w >= max_h then
        -- Split the node vertically
        local split_x = math.random(min_size, max_w - min_size)

        -- Split the node into two
        self.left = Node(self.x, self.y, split_x, max_h)
        self.right = Node(self.x + split_x, self.y, max_w - split_x, max_h)
    else
        -- Split the node horizontally
        local split_y = math.random(min_size, max_h - min_size)

        -- Split the node into two
        self.left = Node(self.x, self.y, max_w, split_y)
        self.right = Node(self.x, self.y + split_y, max_w, max_h - split_y)
    end

    self.left:partition(min_size)
    self.right:partition(min_size)
end

function Node:collectLeaves(list)
    if self.left == nil and self.right == nil then
        table.insert(list, self)
        return
    end

    self.left:collectLeaves(list)
    self.right:collectLeaves(list)
end

function Node:drawRecursive()
    if self.left == nil and self.right == nil then
        -- Leaf node so draw itself
        love.graphics.setColor(self.color)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

        return
    end

    -- Recurse both child node
    self.left:drawRecursive()
    self.right:drawRecursive()
end

function Node:draw()
    self:drawRecursive()
end

return Node
