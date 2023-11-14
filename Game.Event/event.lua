local Functions = {}
local Event = {
    ["Game.Run"] = {},
    ["Game.AnyPlayer.EnterGame"] = {},
    ["Player.NewInputContent"] = {},
    ["UI.Button.click"] = {},
    ["UI.Touch.begin"] = {},
}


function Event.addListener (event, func)
    table.insert(Event[event], func)
end

function Event.removeListener (event, func)
    local funcs = Event[event]
    for i = 1, #funcs do
        if funcs[i].__tostring == funcs.__tostring then
            table.remove(funcs, i)
            print("xoa event")
            break
        else
            print(string.len(funcs[i]))
            print(string.len(func))

        end
    end
end

_G.Event = Event
_G.Functions = Functions
print("Event: ", Event)
