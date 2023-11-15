local v = _G
-- local Function = v.Function
local Event = v.Event
local BaseUI = v.BaseUI

local ui1 = BaseUI:new{uiid = [[7300959038546430726]]}
local txt1 = [[7300959038546430726_1]]
local btn1 = [[7300959038546430726_3]]
local pic1 = [[7300959038546430726_2]]


local function dat(event)
    local uid, content = event.eventobjid, event.content
    ui1:hideElement(uid, pic1)
    ui1:showElementAll(btn1)
    ui1:rotateElement(uid, txt1, 30)
    ui1:setAlphaAll(btn1, 50)
    ui1:setColorAll(btn1, 0xff00ff)
    ui1:setFontSizeAll(txt1, 8)
    ui1:setPositionAll(txt1, 500, 300)
    ui1:setSizeAll(btn1, 120, 170)
    ui1:setTextAll(txt1, ":)))")
    ui1:setTextureAll(btn1, [[30202]])
    ui1:showElementAll(btn1)
end
-- Function["dat"] = dat

Event.addListener("Player.NewInputContent", "dat", dat)