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
    ["Game.RunTime"] = {},
    ["Game.Start"] = {},
    ["Game.TimeOver	"] = {},
    ["minitimer.change"] = {},
    ["Player.AddBuff"] = {},
    ["Player.AddItem"] = {},
    ["Player.AreaIn"] = {},
    ["Player.AreaOut"] = {},
    ["Player.Attack"] = {},
    ["Player.AttackHit"] = {},
    ["Player.BackPackChange	"] = {},
    ["Player.BeHurt"] = {},
    ["Player.ChangeAttr	"] = {},
    ["Player.ClickActor"] = {},
    ["Player.ClickBlock	"] = {},
    ["Player.Collide"] = {},
    ["Player.ConsumeItem"] = {},
    ["Player.DamageActor"] = {},
    ["Player.DefeatActor"] = {},
    ["Player.Die"] = {},
    ["Player.DiscardItem"] = {},
    ["Player.DismountActor"] = {},
    ["Player.EquipChange"] = {},
    ["Player.EquipOff"] = {},
    ["Player.EquipOn"] = {},
    ["Player.Init"] = {},
    ["Player.InputContent"] = {},
    ["Player.InputKeyDown"] = {},
    ["Player.InputKeyOnPress"] = {},
    ["Player.InputKeyUp"] = {},
    ["Player.JoinTeam"] = {},
    ["Player.LevelModelUpgrade"] = {},
    ["Player.MotionStateChange"] = {},
    ["Player.MountActor"] = {},
    ["Player.MoveOneBlockSize"] = {},
    ["Player.NewInputContent"] = {},
    ["Player.PickUpItem"] = {},
    ["Player.PlayAction"] = {},
    ["Player.RemoveBuff"] = {},
    ["Player.Revive"] = {},
    ["Player.SelectShortcut"] = {},
    ["Player.ShortcutChange"] = {},
    ["Player.UseItem"] = {},
    ["Actor.AddBuff"] = {},
    ["Actor.AreaIn"] = {},
    ["Actor.AreaOut"] = {},
    ["Actor.Attack"] = {},
    ["Actor.AttackHit"] = {},
    ["Actor.BeGreetedBy"] = {},
    ["Actor.BeHurt"] = {},
    ["Actor.Beat"] = {},
    ["Actor.ChangeAttr"] = {},
    ["Actor.ChangeMotion"] = {},
    ["Actor.Collide"] = {},
    ["Actor.Create"] = {},
    ["Actor.Damage"] = {},
    ["Actor.Die"] = {},
    ["Actor.InteractEvent"] = {},
    ["Actor.NewBeHurt"] = {},
    ["Actor.Projectile.Hit"] = {},
    ["Actor.RemoveBuff"] = {},
    ["Actor.ReqHelp"] = {},
    ["Actor.VillageBindPosChange"] = {},
    ["Actor.VillagerFlagChange"] = {},
    ["Block.Add"] = {},
    ["Block.DestroyBy"] = {},
    ["Block.Dig.Begin"] = {},
    ["Block.Dig.Cancel"] = {},
    ["Block.Dig.End"] = {},
    ["Block.Fertilize"] = {},
    ["Block.PlaceBy"] = {},
    ["Block.Remove"] = {},
    ["Block.Trigger"] = {},
    ["DropItem.AreaIn"] = {},
    ["DropItem.AreaOut"] = {},
    ["Item.Disappear"] = {},
    ["Item.Pickup"] = {},
    ["Missile.AreaIn"] = {},
    ["Missile.AreaOut"] = {},
    ["Missile.Create"] = {},
    ["Particle.Mob.OnCreate"] = {},
    ["Particle.Player.OnCreate"] = {},
    ["Particle.Pos.OnCreate"] = {},
    ["Particle.Projectile.OnCreate"] = {},
    ["UI.Button.Click"] = {},
    ["UI.Button.TouchBegin"] = {},
    ["UI.Hide"] = {},
    ["UI.LostFocus"] = {},
    ["UI.Show"] = {},
    registered = {}
}

local function check_exist(tbl, el)
    for i = 1, #tbl do
        if tbl[i] == el then
            return i
        end
    end
    return nil
end

---Register an event, be ready to add it's listeners
---@param eventname string
function Event.register(eventname)
    assert(Event[eventname]~=nil, string.format("Event %s is not supported", eventname))
    local registered = Event.registered
    local loc = check_exist(registered, eventname)
    if loc then return end

    ScriptSupportEvent:registerEvent(eventname, function (event)
        local funcs = Event[eventname]
        local funcs_do = {}
        for i = 1, #funcs do
            funcs_do[i] = type(funcs[i]) == "function" and funcs[i] or Function[funcs[i]]
        end

        for i = 1, #funcs_do do
            funcs_do[i](event)
        end
    end)
    Event.registered[#Event.registered+1] = eventname
end

---Add a listener function to an event (must register that event first)
---@param eventname string
---@param funcname string
---@param func function
function Event.addListener(eventname, funcname, func)
    local registered = Event.registered
    local loc = check_exist(registered, eventname)
    if not loc then
        Event.register(eventname)
    end

    local funcs = Event[eventname]
    loc = check_exist(funcs, funcname)
    if not loc then
        Function[funcname] = func
        table.insert(funcs, funcname)
    end
end

---Add listener, no need key
---@param eventname string
---@param func function
function Event.addListener_noKey(eventname, func)
    local registered = Event.registered
    local loc = check_exist(registered, eventname)
    if not loc then
        Event.register(eventname)
    end

    local funcs = Event[eventname]
    loc = check_exist(funcs, func)
    if not loc then
        table.insert(funcs, func)
    end
end

---Add listener without address
---
---But it's pair need to be added later `Event.addPair("my_function", my_function)`
---@param eventname string
---@param funcname string
function Event.addListener_noAddress(eventname, funcname)
    local registered = Event.registered
    local loc = check_exist(registered, eventname)
    if not loc then
        Event.register(eventname)
    end

    local funcs = Event[eventname]
    loc = check_exist(funcs, funcname)
    if not loc then
        table.insert(funcs, funcname)
    end
end

---Add pair of function
---
---`Function["my_function"] = my_function`
---@param funcname string
---@param func function
function Event.addPair(funcname, func)
    Function[funcname] = func
end

---Remove a listener function from an event
---@param eventname string
---@param funcname string
function Event.removeListener(eventname, funcname)
    local funcs = Event[eventname]
    local loc = check_exist(funcs, funcname)
    if loc then
        table.remove(funcs, loc)
    end
end


---Remove a listener function from an event
---@param eventname string
---@param func function
function Event.removeListener_address(eventname, func)
    local funcs = Event[eventname]
    local loc = check_exist(funcs, func)
    if loc then
        table.remove(funcs, loc)
    end
end

_G.Event = Event
