delay = 200
delaypath = 200
var = {}
var.v0 = "OnTalkBubble"
var.v1 = GetLocal().netID
var.v2 = "`bScript Was Remade By `#Alpha (gems)"
SendVariant(var)
SendPacket(2, [[
action|input
|text|/ghost]])
Sleep(1000)
EditToggle("ModFly", true)
Sleep(1000)
function getTiles()
  tile = {}
  for XS = 0, 150, 50 do
    XE = XS + 49
    for py = 193, 0, -2 do
      for px = XS, XE do
        int = {
          x = px,
          y = py,
          fg = GetTile(px, py).fg,
          bg = GetTile(px, py).bg
        }
        table.insert(tile, int)
      end
      poy = py - 1
      for px = XE, XS, -1 do
        int = {
          x = px,
          y = poy,
          fg = GetTile(px, poy).fg,
          bg = GetTile(px, poy).bg
        }
        table.insert(tile, int)
      end
    end
  end
  return tile
end
function findPath(x, y)
  px = math.floor(GetLocal().posX / 32)
  py = math.floor(GetLocal().posY / 32)
  jarax = x - px
  jaray = y - py
  if jaray > 6 then
    for i = 0, math.floor(jaray / 2) do
      py = py + 2
      Sleep(delaypath)
      FindPath(px, py)
    end
  elseif jaray < -6 then
    for i = 1, math.floor(jaray / -2) do
      py = py - 2
      Sleep(delaypath)
      FindPath(px, py)
    end
  end
  if jarax > 6 then
    for i = 1, math.floor(jarax / 2) do
      px = px + 2
      Sleep(delaypath)
      FindPath(px, py)
    end
  elseif jarax < -6 then
    for i = 1, math.floor(jarax / -2) do
      px = px - 2
      Sleep(delaypath)
      FindPath(px, py)
    end
  end
  Sleep(20)
  FindPath(x, y)
  Sleep(20)
end
function punch(x, y)
  pkt = {}
  pkt.px = x
  pkt.py = y
  pkt.type = 3
  pkt.value = 18
  while 0 ~= GetTile(x, y).fg or 0 ~= GetTile(x, y).bg do
    pkt.x = GetLocal().posX
    pkt.y = GetLocal().posY
    SendPacketRaw(false, pkt)
    Sleep(delay)
  end
end
for _, tile in pairs(getTiles()) do
  if (tile.fg == 12986 or tile.fg == 12988 or tile.bg == 1102 or tile.fg == 1104 or 0 == tile.fg and 0 ~= tile.bg) and (0 ~= GetTile(tile.x, tile.y).fg or 0 ~= GetTile(tile.x, tile.y).bg) then
    findPath(tile.x, tile.y + 1)
    Sleep(200)
    punch(tile.x, tile.y)
    Sleep(200)
    punch(tile.x, tile.y)
    Sleep(200)
  end
end
return
