local Class = {}
Class.__index = Class
function Class:new() end

function Class:extend()
    local new_class = {}
    
    for k,v in pairs(self) do
        if not string.find(k, "__") then goto continue end
        new_class[k] = v
        ::continue::
    end

    setmetatable(new_class, self) 
    new_class.super = self
    new_class.__index = new_class
    return new_class
end

function Class:implement(...)
    for k, v in pairs({...}) do
        if self[k] then goto continue end
        self[k] = v
        ::continue::
    end
end

function Class:is(Parent)
    if self == Parent then return true end
    local meta = getmetatable(self)
    while meta do
        if meta == Parent then return true end
        meta = getmetatable(meta)
    end
    return false
end

function Class:__call(...)
    local object = setmetatable({}, self)
    object:new(...)
    return object
end

function Class:__tostring()
    local str = "{\n\t%sparent: {\n\t\t%s\n\t\t}\n}" 
    local buffer = ""
    local meta_buffer = ""
    local pair = ""
    for k,v in pairs(self) do
     if type(v) == "nil" then pair = k.." : nil"
     elseif type(v) == "function" then pair = k..": function"
     elseif type(v) == "table" then pair = k.." : table"
     else pair = k.." : "..v end
     buffer = buffer..pair..", \n\t"
    end
    for k,v in pairs(getmetatable(self)) do
     if type(v) == "nil" then pair = k.." : nil"
     elseif type(v) == "function" then pair = k..": function"
     elseif type(v) == "table" then pair = k.." : table"
     else pair = k.." : "..v end
     meta_buffer = meta_buffer..pair..", \n\t\t"
    end
    if meta_buffer ~= "" then meta_buffer = meta_buffer:sub(1,-5) end
    return string.format(str, buffer, meta_buffer)
 end
return Class