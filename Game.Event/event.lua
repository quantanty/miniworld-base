local v = _G
local ScriptSupportEvent = ScriptSupportEvent
local Function = v.Function

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
    ["Game.End"] = {},
    ["Game.Hour"] = {},
    ["Game.Load"] = {},
    ["Game.Run"] = {},
    ["Game.RunTime	"] = {},
    ["Game.Start"] = {},
    ["Game.TimeOver	"] = {},
    ["minitimer.change"] = {},
    ["Player.AddBuff"] = {},
    ["Player.AddItem"] = {},
    ["Player.AreaIn"] = {},
    ["Player.NewInputContent"] = {},
    ["UI.Button.click"] = {},
    ["UI.Touch.begin"] = {},
    regiterd = {}
}

function Event.register(eventString)
    ScriptSupportEvent:registerEvent(eventString, function (event)
        local funcs = Event[eventString]
        for i = 1, #funcs do
            Function[funcs[i]](event)
        end
    end)
end

function Event.registerAll()
    for eventString, v in ipairs(Event) do
        ScriptSupportEvent:registerEvent(eventString, function (event)
            local funcs = Event[eventString]
            for i = 1, #funcs do
                Function[funcs[i]](event)
            end
        end)
    end
end


function Event.addListener (event, funcname)
    local registerd = Event.regiterd
    local exist = false
    for i = 1, #registerd do
        if registerd[i] == event then
            exist = true break
        end
    end
    if not exist then
        Event.register(event)
        registerd[#registerd+1] = event
    end
    table.insert(Event[event], funcname)
end

function Event.removeListener (event, funcname)
    local funcs = Event[event]
    for i = 1, #funcs do
        if funcs[i] == funcname then
            table.remove(funcs, i)
            break
        end
    end
end

_G.Event = Event