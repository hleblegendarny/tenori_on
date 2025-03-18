local Class = require "lib.common.class"
require "lib.visual.goopie"
local TenoriOnScene = Class:extend()
-- attributes
TenoriOnScene.timer_limit = 30
TenoriOnScene.timer = TenoriOnScene.timer_limit
TenoriOnScene.w, TenoriOnScene.h = love.graphics.getDimensions()
--methods
---------------
--[[N O N E]]
---------------
--scene_methods

function TenoriOnScene:load() 
    gooi.newButton({text = "exit",w=150,h=30,x=100,y=100}):onRelease(function ()
        gooi.confirm({text = "are ya?", ok = function ()
            love.event.quit()
        end}) 
    end):warning()
end

function TenoriOnScene:update(dt)
    
    self.timer = self.timer - dt
    
    if self.timer <= 0 then 
        self.timer = self.timer_limit 
    end
end

function TenoriOnScene:draw()
    love.graphics.printf(
        string.format("%.2f",self.timer), --text
        self.w/2-30,                      --x
        self.h/2-30,                      --y
        40                                --limit
    )
    gooi.draw()
end

function TenoriOnScene:mousepressed(x,y,id)
    gooi.pressed(id,x,y)
end
function TenoriOnScene:mousereleased(x,y,id)
    gooi.released(id,x,y)
end
function TenoriOnScene:keypressed(k)
    if k == "escape" then gooi.confirm({text = "Gaddem!", ok = function () love.event.quit() end}) end
end


return TenoriOnScene