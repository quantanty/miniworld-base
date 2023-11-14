local v = _G
local Event = v.Event
local Functions = v.Function

local function sayHello()
    Chat:sendSystemMsg("Hello!!")
    Event.removeListener("Player.NewInputContent", "sayHello")
end
Functions["sayHello"] = sayHello

-- add listener
Event.addListener("Player.NewInputContent", "sayHello")