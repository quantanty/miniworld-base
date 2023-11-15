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
    registered = {}
}

function Event.register(eventname)
    Chat:sendSystemMsg("registering "..eventname.."...")
    ScriptSupportEvent:registerEvent(eventname, function (event)
        local funcs = Event[eventname]
        for i = 1, #funcs do
            Function[funcs[i]](event)
        end
    end)
    Chat:sendSystemMsg("registration finished")
    Event.registered[#Event.registered+1] = eventname
    Chat:sendSystemMsg(""..eventname)
    Chat:sendSystemMsg(""..#Event.registered)
end

-- function Event.registerAll()
--     for eventname, v in ipairs(Event) do
--         ScriptSupportEvent:registerEvent(eventname, function (event)
--             local funcs = Event[eventname]
--             for i = 1, #funcs do
--                 Function[funcs[i]](event)
--             end
--         end)
--     end
-- end


function Event.addListener (eventname, funcname, func)
    if Function[funcname] == nil then Function[funcname] = func end
    local registered = Event.registered
    local exist = false
    for i = 1, #registered do
        if registered[i] == eventname then
            exist = true break
        end
    end
    if exist then
        Chat:sendSystemMsg("add "..funcname)
        table.insert(Event[eventname], funcname)
    end
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