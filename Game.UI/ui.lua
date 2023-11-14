local Customui = Customui
local World = World
local UI = {uiid = [[0]]}

function UI:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function UI:setText (uid, element, text)
    Customui:setText(uid, self.uiid, element, text)
end

function UI:setTextAll (element, text)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setText(uid, self.uiid, element, text)
    end
end

function UI:setTexture(uid, element, url)
    Customui:setTexture(uid, self.uiid, element, url)
end

function UI:setTextureAll(element, url)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setTexture(uid, self.uiid, element, url)
    end
end

function UI:setSize(uid, element, width, height)
    Customui:setSize(uid, self.uiid, element, width, height)
end

function UI:setsize(element, width, height)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setSize(uid, self.uiid, element, width, height)
    end
end

function UI:setFontSize(uid, element, size)
    Customui:setFontSize(uid, self.uiid, element, size)
end

function UI:setFontSizeAll(element, size)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setFontSize(uid, self.uiid, element, size)
    end
end

function UI:setColor(uid, element, color)
    Customui:setColor(uid, self.uiid, element, color)
end

function UI:setColorAll(element, color)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setColor(uid, self.uiid, element, color)
    end
end

function UI:showElement(uid, element)
    Customui:showElement(uid, self.uiid, element)
end

function UI:showElementAll(element)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:showElement(uid, self.uiid, element)
    end
end

function UI:hideElement(uid, element)
    Customui:hideElement(uid, self.uiid, element)
end

function UI:hideElementAll(element)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:hideElement(uid, self.uiid, element)
    end
end

function UI:rotateElement(uid, element, rotate)
    Customui:rotateElement(uid, self.uiid, element, rotate)
end

function UI:rotateElementAll(element, rotate)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:roatteElement(uid, self.uiid, element, rotate)
    end
end

function UI:setAlpha(uid, element, alpha)
    Customui:setAlpha(uid, self.uiid, element, alpha)
end

function UI:setAlphaAll(element, alpha)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setAlpha(uid, self.uiid, element, alpha)
    end
end

function UI:setState(uid, pageIndex)
    Customui:setState(uid, self.uiid, pageIndex)
end

function UI:setStateAll(pageIndex)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setState(uid, self.uiid, pageIndex)
    end
end

function UI:setPosition(uid, element, x, y)
    Customui:setPosition(uid, self.uiid, element, x, y)
end

function UI:setPositionAll(element, x, y)
    local l, n, array = World:getAllPlayers(-1)
    for i, uid in ipairs(array) do
        Customui:setPosition(uid, self.uiid, element, x, y)
    end
end

_G.UI = UI