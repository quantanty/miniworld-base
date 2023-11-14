local Event = _G.Event
local Functions = _G.Functions

function Event.register(eventString)
    ScriptSupportEvent:registerEvent(eventString, function (event)
        local funcs = Event[eventString]
        for i = 1, #funcs do
            Functions[funcs[i]](event)
        end
    end)
end

function Event.registerAll()
    for eventString, v in ipairs(Event) do
        ScriptSupportEvent:registerEvent(eventString, function (event)
            local funcs = Event[eventString]
            for i = 1, #funcs do
                Functions[funcs[i]](event)
            end
        end)
    end
end