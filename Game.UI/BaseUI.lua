local Customui = Customui
local World = World

---@class BaseUI
---@field uiid string: ID of the interface
local BaseUI = {uiid = [[0]]}

---Create new BaseUI object
---@param o any
---@return BaseUI
function BaseUI:new (o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

---Set the content of the text element
---@param playerid number: player ID: player ID
---@param elementid string: element ID: element ID
---@param text string: text content
function BaseUI:setText (playerid, elementid, text)
    Customui:setText(playerid, self.uiid, elementid, text)
end

---Set the content of the text element for all players
---@param elementid string: element ID
---@param text string: text content
function BaseUI:setTextAll (elementid, text)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setText(playerid, self.uiid, elementid, text)
    end
end

---Set the parttern texture of element
---@param playerid number: player ID
---@param elementid string: element ID
---@param url string: pattern texture ID
function BaseUI:setTexture(playerid, elementid, url)
    Customui:setTexture(playerid, self.uiid, elementid, url)
end

---Set the pattern texture of element for all players
---@param elementid string: element ID
---@param url string: pattern texture ID
function BaseUI:setTextureAll(elementid, url)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setTexture(playerid, self.uiid, elementid, url)
    end
end

---Set the component size
---@param playerid number: player ID
---@param elementid string: element ID
---@param width number: element width
---@param height number: element height
function BaseUI:setSize(playerid, elementid, width, height)
    Customui:setSize(playerid, self.uiid, elementid, width, height)
end

---Set the component size for all players
---@param elementid string: element ID
---@param width number: element width
---@param height number: element height
function BaseUI:setSizeAll(elementid, width, height)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setSize(playerid, self.uiid, elementid, width, height)
    end
end

---Set the font size of text component
---@param playerid number: player ID
---@param elementid string: element ID
---@param size number: font size
function BaseUI:setFontSize(playerid, elementid, size)
    Customui:setFontSize(playerid, self.uiid, elementid, size)
end

---Set the font size of text component for all players
---@param elementid string: element ID
---@param size number: font size
function BaseUI:setFontSizeAll(elementid, size)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setFontSize(playerid, self.uiid, elementid, size)
    end
end

---Set the color of element
---@param playerid number: player ID
---@param elementid string: element ID
---@param color number: color value (0xFFFFFF)
function BaseUI:setColor(playerid, elementid, color)
    Customui:setColor(playerid, self.uiid, elementid, color)
end

---Set the color of element for all players
---@param elementid string: element ID
---@param color number: color value (0xFFFFFF)
function BaseUI:setColorAll(elementid, color)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setColor(playerid, self.uiid, elementid, color)
    end
end

---Display component
---@param playerid number: player ID
---@param elementid string: element ID
function BaseUI:showElement(playerid, elementid)
    Customui:showElement(playerid, self.uiid, elementid)
end

---Display component for all players
---@param elementid string: element ID
function BaseUI:showElementAll(elementid)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:showElement(playerid, self.uiid, elementid)
    end
end

---Hidden component
---@param playerid number: player ID
---@param elementid string: element ID
function BaseUI:hideElement(playerid, elementid)
    Customui:hideElement(playerid, self.uiid, elementid)
end

---Hidden component for all players
---@param elementid string: element ID
function BaseUI:hideElementAll(elementid)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:hideElement(playerid, self.uiid, elementid)
    end
end

---Rotate element
---
---`rotate`: rotation angle
---@param playerid number: player ID
---@param elementid string: element ID
---@param rotate number: rotation angle
function BaseUI:rotateElement(playerid, elementid, rotate)
    Customui:rotateElement(playerid, self.uiid, elementid, rotate)
end

---Rotate element for all players
---@param elementid string: element ID
---@param rotate number: rotation angle
function BaseUI:rotateElementAll(elementid, rotate)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:roatteElement(playerid, self.uiid, elementid, rotate)
    end
end

---Set the transparency of component
---@param playerid number: player ID
---@param elementid string: element ID
---@param alpha number: transparency
function BaseUI:setAlpha(playerid, elementid, alpha)
    Customui:setAlpha(playerid, self.uiid, elementid, alpha)
end

---Set the transparency of component for all players
---@param elementid string: element ID
---@param alpha number: transparency
function BaseUI:setAlphaAll(elementid, alpha)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setAlpha(playerid, self.uiid, elementid, alpha)
    end
end

---Set status of component
---@param playerid number: player ID
---@param elementid string: element ID
---@param pageIndex number: status value
function BaseUI:setState(playerid, elementid, pageIndex)
    Customui:setState(playerid, self.uiid, elementid, pageIndex)
end

---Set status of component for all players
---@param elementid string: element ID: element ID
---@param pageIndex string: status value
function BaseUI:setStateAll(elementid, pageIndex)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setState(playerid, self.uiid, elementid, pageIndex)
    end
end

---Set the location of component
---@param playerid number: player ID
---@param elementid string: element ID
---@param x number: X coordinate value
---@param y number: Y coordinate value
function BaseUI:setPosition(playerid, elementid, x, y)
    Customui:setPosition(playerid, self.uiid, elementid, x, y)
end

---Set the location of component for all players
---@param elementid string: element ID
---@param x number: X coordinate value
---@param y number: Y coordinate value
function BaseUI:setPositionAll(elementid, x, y)
    local l, n, array = World:getAllPlayers(-1)
    for i, playerid in ipairs(array) do
        Customui:setPosition(playerid, self.uiid, elementid, x, y)
    end
end

_G.BaseUI = BaseUI