local Event = _G.Event
local Functions = _G.Functions

local function sayHello()
    Chat:sendSystemMsg("Hello!!")
    Event.removeListener("Player.NewInputContent", "sayHello")
end
Functions["sayHello"] = sayHello


Event.addListener("Player.NewInputContent", "sayHello")