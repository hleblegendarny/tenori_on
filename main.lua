local scenery = require "lib.common.scenery"
scenery = scenery("tenori_on", "scenes")
scenery:hook(love)

function love.keypressed(k)
    if k == "escape" then love.event.quit() end
end