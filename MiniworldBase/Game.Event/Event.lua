local ScriptSupportEvent = ScriptSupportEvent
local Function = {}

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

---Register an event, be ready to add it's listeners
---@param eventname string
function Event.register(eventname)
    ScriptSupportEvent:registerEvent(eventname, function (event)
        local funcs = Event[eventname]
        for i = 1, #funcs do
            Function[funcs[i]](event)
        end
    end)
    Event.registered[#Event.registered+1] = eventname
    print(string.format("Registration finished, event name: %s", eventname))
    print(string.format("# Event registered: %d", #Event.registered))
end

---Add a listener function to an event (must register that event first)
---@param eventname string
---@param funcname string
---@param func function
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

---Remove a listener function from an event
---@param eventname string
---@param funcname string
function Event.removeListener (eventname, funcname)
    local funcs = Event[eventname]
    for i = 1, #funcs do
        if funcs[i] == funcname then
            table.remove(funcs, i)
            break
        end
    end
end

_G.Event = Event