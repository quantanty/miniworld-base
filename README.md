# Mini World Base Script v1.3

At this point, class `ScriptSupportEvent` of Mini World APIs only provides the event registration procedure `ScriptSupportEvent:registerEvent` and not the cancellation procedure. Therefore, it's very difficult for devs to code.

To overcome this difficulty, MiniwordBase provides APIs that can register event and cancel.

## What makes MWBase so special?
- **Register and remove event at anytime (even after compilation, which `ScriptSupportEvent:registerEvent` cannot do)**
- **A function can remove event itself**
- **2 functions can [remove or add] each other**

```lua
local Event = _G.Event

local function player_chat(event)
    Chat:sendSystemMsg(""..event.eventobjid..": "..event.content)

    -- this function can remove itself from event handler
    -- the event handler won't call it anymore
    Event.removeListener_address("Player.NewInputContent", player_chat)
end

Event.addListener_noKey("Player.NewInputContent", player_chat)
```

## Document
Here is Markdown [Document](./docs/) in folder ./docs/

## Basic Script Example

Import modules via environment variable `_G`
```lua
local v = _G
local Event = v.Event
local BaseUI = v.BaseUI
```

Define a BaseUI object and some components from ID, use`BaseUI:new()`
```lua
-- copy IDs and paste here
local ui1 = BaseUI:new{uiid = [[7300959038546430726]]} -- interface
local txt1 = [[7300959038546430726_1]] -- label
local btn1 = [[7300959038546430726_3]] -- button
local pic1 = [[7300959038546430726_2]] -- picture
```

Define some interesting function 
```lua
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
        ui1:setSizeAll(btn1, random(100, 200), random(100, 200))
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
```

Add a listener to an event
```lua
Event.addListener("Player.NewInputContent", "chat", chat)
```
