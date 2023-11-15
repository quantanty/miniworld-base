# MiniworldBase Event
Corresponding source file: *Event.lua*

---

At this point, class `ScriptSupportEvent` of Mini World APIs only provides the event registration procedure `ScriptSupportEvent:registerEvent` and not the cancellation procedure. Therefore, it's very difficult for devs to code.

To overcome this difficulty, MiniwordBase provides APIs that can register event and cancel.

---
## Load module
First we must import module via environment variable `_G`

```lua
-- In Mini World we cannot use require("module")
local v = _G
local Event = v.Event
```

---

## `Event.register(eventname)` function
Before adding any listener function for an event, we must register that event.

### parameters
- `eventname`:**`string`**
Describe the event, see wiki [Event](https://developers.miniworldgame.com/wiki/event.html#event-system-event) and [Event UI](https://developers.mini1.cn/wiki/event.html#ui%E4%BA%8B%E4%BB%B6-ui) for detail.

---

## `Event.addListener(eventname, funcname, func)` function
After registering an event, we can add listener functions to it.

### parameters
- `eventname`: **`string`** Describe the event

- `funcname`: **`string`** Name of the function to add

- `func`: **`function`** The function to add

---

## `Event.removeListener(eventname, funcname)` function
When we want a listener to be inactive anymore, we can remove it. Of course we can add it back.

### parameters
- `eventname`: **`string`** Describe the event

- `funcname`: **`string`** Name of the function to remove

---


