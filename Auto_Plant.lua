EditToggle("Send Packet", false)
EditToggle("ModFly", true)
SendPacket(2, [[
action|input
|text|/ghost]])
function checkamount(id)
  for _, item in pairs(GetInventory()) do
    if item.id == id then
      return item.amount
    end
  end
  return 0
end
function XYSeed()
  for _, obj in pairs(GetObjectList()) do
    if obj.itemid == SeedID then
      if 0 == checkamount(SeedID) then
        FindPath(obj.posX / 32, obj.posY / 32)
        Sleep(30)
      end
      if 0 == checkamount(SeedID) then
        FindPath(obj.posX / 32 - 1, obj.posY / 32)
        Sleep(25)
      end
      if 0 == checkamount(SeedID) then
        FindPath(obj.posX / 32 + 1, obj.posY / 32)
        Sleep(20)
      end
    end
  end
end
function YASU(x, y)
  yasu = {}
  yasu.type = 3
  yasu.value = SeedID
  yasu.px = x
  yasu.py = y
  yasu.x = GetLocal().posX
  yasu.y = GetLocal().posY
  SendPacketRaw(false, yasu)
  Sleep(Delay)
end
function Plant()
  for _, tile in pairs(GetTiles()) do
    if 0 == tile.fg and 0 ~= GetTiles(tile.x, tile.y + 1).fg then
      SeedOrNo = GetTiles(tile.x, tile.y + 1).fg / 2
      if not tostring(SeedOrNo):find(".5") and 0 ~= checkamount(SeedID) then
        FindPath(tile.x, tile.y)
        Sleep(30)
        if math.floor(GetLocal().posX / 32) == tile.x and math.floor(GetLocal().posY / 32) == tile.y then
          YASU(tile.x, tile.y, SeedID)
          Sleep(Delay)
        end
      end
    end
  end
end
function main()
  if 0 ~= checkamount(SeedID) then
    Plant()
    Sleep(Delay)
  else
    XYSeed()
    Sleep(Delay)
  end
  main()
end
local var = {}
var.v0 = "OnAddNotification"
var.v1 = "game/sun.rttex"
var.v2 = "`cScript Made By `2t.me/Yasugami"
var.v3 = "audio/gauntlet_spawn.wav"
var.netid = -1
SendVariant(var)
main()
return
