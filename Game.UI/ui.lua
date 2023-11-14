local Customui = Customui
local UI = {}

function UI.setText (element, text)
    print(text)
end

UI.prototype = {uiid = [[0]], UI.setText}


UI.mt = {}
function UI.new (o)
    setmetatable(o, UI.mt)
end
UI.mt.__index = function (t, k)
    return UI.prototype[k]
end

_G.UI = UI