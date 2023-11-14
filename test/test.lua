local Event = _G.Event
local Functions = _G.Functions

local function sayHello()
    Chat:sendSystemMsg("Hello!!")
    Event.removeListener("Player.NewInputContent", "sayHello")
end
Functions["sayHello"] = sayHello

-- register events
Event.register("Player.NewInputContent")

-- add listener
Event.addListener("Player.NewInputContent", "sayHello")