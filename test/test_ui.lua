local v = _G
local Function = v.Function
local Event = v.Event
local UI = v.UI

local ui1 = UI.new{uiid = [[7300959038546430726]]}
local txt1 = [[7300959038546430726_1]]


local function dat(event)
    UI.setTextAll(ui1, txt1, "hello world")
end
Function["dat"] = dat

Event.addListener("Game.AnyPlayer.EnterGame", "dat")