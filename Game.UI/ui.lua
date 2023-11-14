local Customui = Customui
local World = World
local UI = {}

function UI.setText (self, uid, element, text)
    Customui:setText(uid, self.uiid, element, text)
end

function UI.setTextAll (self, element, text)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setText(uid, self.uiid, element, text)
    end
end

UI.prototype = {uiid = [[0]], UI.setText, UI.setTextAll}


UI.mt = {}
function UI.new (o)
    setmetatable(o, UI.mt)
    return o
end
UI.mt.__index = function (t, k)
    return UI.prototype[k]
end

_G.UI = UI