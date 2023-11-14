local v = _G
local Function = v.Function
local Event = v.Event
local UI = v.UI

local ui1 = UI:new{uiid = [[7300959038546430726]]}
local txt1 = [[7300959038546430726_1]]


local function dat(event)
    if event.content == "size" then
        -- UI.setFontSize(ui1, event.eventobjid, txt1, 28)
        ui1:setFontSize(event.eventobjid, txt1, 50)
    elseif event.content == "color" then
        UI.setColor(ui1, event.eventobjid, txt1, 0xff00ff)
    end
    UI.setTextAll(ui1, txt1, "hello world")
end
Function["dat"] = dat

Event.addListener("Player.NewInputContent", "dat")