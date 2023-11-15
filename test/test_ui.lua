local v = _G
local Event = v.Event
local BaseUI = v.BaseUI

Event.register("Game.Run")
Event.register("Player.NewInputContent")

local ui1 = BaseUI:new{uiid = [[7300959038546430726]]}
local txt1 = [[7300959038546430726_1]]
local btn1 = [[7300959038546430726_3]]
local pic1 = [[7300959038546430726_2]]

math.randomseed(os.time())
local random = math.random

local tick = 0
local function dat()
    if tick > 15 then
        local angle = random(0, 359)
        Chat:sendSystemMsg(""..angle)
        ui1:hideElementAll(pic1)
        ui1:showElementAll(btn1)
        ui1:rotateElementAll(txt1, angle)
        ui1:setAlphaAll(btn1, random(40, 80))
        ui1:setFontSizeAll(txt1, random(14, 20))
        ui1:setSizeAll(btn1, 120, 170)
        ui1:setTextAll(txt1, ""..os.time())
        ui1:setTextureAll(btn1, [[30202]])
        ui1:setColorAll(btn1, random(0x000000, 0xffffff))
        ui1:setPositionAll(txt1, random(200, 700), random(50, 400))
        ui1:showElementAll(btn1)
        tick = 0
    end
    tick = tick + 1
end

local function chat(event)
    local uid, content = event.eventobjid, event.content
    if content == "remove" then
        Event.removeListener("Game.Run", "dat")
    elseif content == "add" then
        tick = 16
        Event.addListener("Game.Run", "dat", dat)
    end
end

Event.addListener("Player.NewInputContent", "chat", chat)