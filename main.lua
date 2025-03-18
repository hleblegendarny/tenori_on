local scenery = require "lib.common.scenery"
scenery = scenery("tenori_on", "scenes")
scenery:hook(love, {'load', 'update', 'draw', 'mousepressed', 'mousereleased', 'keypressed'})
