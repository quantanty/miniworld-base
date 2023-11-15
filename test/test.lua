local v = _G
local Event = v.Event

local function sayHello(event)
    Chat:sendSystemMsg("Hello!!")
    Event.removeListener("Player.NewInputContent", "sayHello")
end

-- add listener
Event.addListener("Player.NewInputContent", "sayHello", sayHello)