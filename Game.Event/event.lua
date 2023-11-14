local Functions = {}
local Event = {
    ["Weather.Changed"] = {},
    ["Backpack.ItemTakeOut"] = {},
    ["Backpack.ItemPutIn"] = {},
    ["Backpack.ItemChange"] = {},
    ["Game.AnyPlayer.Defeat"] = {},
    ["Game.AnyPlayer.EnterGame"] = {},
    ["Game.AnyPlayer.LeaveGame"] = {},
    ["Game.AnyPlayer.ReadStage"] = {},
    ["Game.AnyPlayer.Victory"] = {},
    ["Game.Run"] = {},
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
            break
        end
    end
end

_G.Event = Event
_G.Functions = Functions
