local class = require "class"

local World = class:extend()
World.entites = {}
local Component = class:extend()
local Tag = Component:extend()

function Tag:new(name) self.tag = name end

local Position = Component:extend()
function Position:new(x,y) self.x = x self.y = y end

local Bundle = Component:extend()
function Bundle:new(...)
    self.components = {}
    for _,v in pairs({...}) do
        table.insert(self.components, v)
    end
end
function World:add(...)
    for _,b in pairs({...}) do
        table.insert(self.entites, b)
    end
end
function World:get(component, tag)
    local store = {}
    for _,b in pairs(self.entites) do
        for _,c in pairs(b.components) do
            if c:is(Tag) and tag then
                if c.tag ~= tag then break end
            end
            if c:is(component) then table.insert(store, c) end
        end
        
    end
    if #store < 1 then return nil end
    if #store == 1 then store = store[1] end
    return store
end
World:add(Bundle(Tag('Player'),Position(6,9)),Bundle(Tag('Enemy'),Position(9,6)))
local TransfromPlayerSys = function ()
    local iter = World:get(Position, 'Player')
    print(iter)
end
TransfromPlayerSys()