local v = _G
local Event = v.Event
local Function = v.Function

local function sayHello()
    Chat:sendSystemMsg("Hello!!")
    Event.removeListener("Player.NewInputContent", "sayHello")
end
Function["sayHello"] = sayHello

-- add listener
Event.addListener("Player.NewInputContent", "sayHello")