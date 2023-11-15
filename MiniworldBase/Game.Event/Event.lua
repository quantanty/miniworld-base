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