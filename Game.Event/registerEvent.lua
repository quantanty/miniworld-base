local Event = _G.Event
local Functions = _G.Functions

ScriptSupportEvent:registerEvent("Player.NewInputContent", function (event)
    local funcs = Event["Player.NewInputContent"]
    for i = 1, #funcs do
        Functions[funcs[i]](event)
    end
end)

Chat:sendSystemMsg("Event done")