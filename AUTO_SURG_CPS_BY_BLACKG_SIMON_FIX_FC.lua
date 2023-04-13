PPS = 10000
SendPacket(2, [[
action|input
|text|`bSCRIPT BY SIMON & BLACKG]])
Sleep(900)
SendPacket(2, [[
action|input
|text|`bSCRIPT LOADING MOHON CEK CONSOLE]])
Sleep(1100)
LogToConsole("[`#SCRIPT LOADING]")
Sleep(1200)
LogToConsole("[`#SCRIPT LOADING.]")
Sleep(1300)
LogToConsole("[`#SCRIPT LOADING..]")
Sleep(1400)
LogToConsole("[`#SCRIPT LOADING...]")
Sleep(1500)
LogToConsole("[`#SCRIPT LOADED]")
Sleep(2000)
dialog = "add_label_with_icon|big|`6Auto SURG|left|" .. 5956 .. [[
|
add_spacer|small|
add_label_with_icon|small|`0Information!|left|2480|
add_textbox|`6Script Made By `b@Simon `6And `b@BlackGCH|left|
add_textbox|`bThis Script Beta Version! So There Have Little Bug|left|
add_spacer|small|
add_label_with_icon|small|`0`0Read This!|left|32|
add_textbox|`b- This Script Work Only In Creative-PS|left|
add_textbox|`b- Do Not Resell This!!|left|
add_spacer|small|
add_label_with_icon|small|`bBlackG Group|3229|3898|
add_spacer|small|
add_url_button|comment|`7 Telegram |noflags|https://t.me/BlackGGroup| Check My Telegram Group!|18|
add_label_with_icon|small|`0My Social Media!|3229|3898|
add_spacer|small|
add_url_button|comment|`6 Telegram |noflags|https://t.me/SimonRileyScript|Check Out My Telegram!|18|
add_spacer|small|
add_button||                       Continue!                       |]]
var = {}
var.v0 = "OnDialogRequest"
var.v1 = dialog
SendVariant(var)
id = 4296
function PlaceTile(id, x, y)
  pkt = {}
  pkt.x = GetLocal().posX
  pkt.y = GetLocal().posY
  pkt.px = x
  pkt.py = y
  pkt.type = 3
  pkt.value = id
  SendPacketRaw(false, pkt)
end
function surge()
  PlaceTile(id, math.floor(GetLocal().posX / 32), math.floor(GetLocal().posY / 32))
end
function sponge()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_0]])
  LogToConsole("[`#Simon Using Sponge]")
  Sleep(100)
end
function anasthetic()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_2]])
  LogToConsole("[`#Simon Using Anasthetic]")
  Sleep(100)
end
function scalpel()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_1]])
  LogToConsole("[`#Simon Using Scalpel]")
  Sleep(100)
end
function antiseptic()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_3]])
  LogToConsole("[`#Simon Using Antiseptic]")
  Sleep(100)
end
function antibiotics()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_4]])
  LogToConsole("[`#Simon Using Antibiotic]")
  Sleep(100)
end
function stitches()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_6]])
  LogToConsole("[`#Simon Using Stitches]")
  Sleep(100)
end
function fix()
  SendPacket(2, [[
action|dialog_return
dialog_name|surgery
buttonClicked|command_7]])
  LogToConsole("[`#Simon FIX IT]")
  Sleep(100)
end
function surg(var)
  if var.v1:find("OnDialogRequest") and var.v2:find([[
|dialog_return
dialog_name|surgery
buttonClicked|command_7]]) then
    scalpel = false
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find([[
|dialog_return
dialog_name|surgery
buttonClicked|command_2]]) then
    stitches = false
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find([[
|dialog_return
dialog_name|surgery
buttonClicked|command_0]]) then
    stitches = false
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find([[
|dialog_return
dialog_name|surgery
buttonClicked|command_7]]) then
    stitches = true
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("Status: `4Awake!") and var.v2:find("command_2") then
    tool = "Anasthetic"
    anasthetic()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("Operation site: `6Unclean") and var.v2:find("command_3") then
    tool = "Antiseptic"
    antiseptic()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You spilled antiseptic on your shoes(.+) They are very clean now(.+)") and var.v2:find("command_3") then
    tool = "Antiseptic"
    antiseptic()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`4You can't see what you are doing(!+)") and var.v2:find("command_0") then
    tool = "Sponge"
    sponge()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`6It is becoming hard to see your work(.+)") and var.v2:find("command_0") then
    tool = "Sponge"
    sponge()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("Patient's fever is`3slowly rising(.+)") and var.v2:find("command_4") then
    tool = "Antibiotics"
    antibiotics()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("The patient falls into a deep sleep(.+)") and var.v2:find("command_4") then
    tool = "Antibiotics"
    antibiotics()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("This is the wrong medication(! +) The bacteria like it(.+)") and var.v2:find("command_4") then
    tool = "Antibiotics"
    antibiotics()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You mopped up the operating site") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You somehow tied yourself up in stitches!") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You grafted in some nice new arteries(!+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You disinfected the operating site(.+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You stitched up an incision(.+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You excised the tumor(!+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You popped in a fresh new kidney(!+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You yanked out the appendix(!+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You got the lock out(!+) (You don't get to keep it)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You repaired the disc(!+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You bandaged some injuries(.+)") and var.v2:find("command_6") then
    tool = "Stitches"
    stitches()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("The patient falls into a deep sleep(.+)") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("This is the wrong medication! the bacteria like it(.+)") and var.v2:find("command_4") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You used antibiotics to reduce the patient's infection(.+)") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("With such tough skin , it'll take another cut to get through(.+)") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You've made a neat incision(.+)") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("This will leave a nasty scar, but you managed to cut the right place.") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You tried to stitch your patient's mouth shut!(.+)") and var.v2:find("command_1") then
    tool = "Scalpel"
    scalpel()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You screwed it up(!+)  Try again(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You mopped up the operating site(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`4You stabbed the patient in a vital organ(!+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`0The lungs are now exposed(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`0The heart now exposed for operating(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("`0You now have access to the appendix(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You now have access to the bad kidney(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You've finally found the tumor(!+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You've opened the stomach(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  elseif var.v1:find("OnDialogRequest") and var.v2:find("You tried to stitch your patient's mouth shut!(.+)") and var.v2:find("command_7") then
    tool = "Fix it"
    fix()
    return true
  end
  return false
end
AddHook(surg, "OnVariant")
while true do
  surge()
  SendPacket(2, [[
action|dialog_return
|dialog_name|surge_edit
|x|]] .. math.floor(GetLocal().posX / 32) .. [[
|
y|]] .. math.floor(GetLocal().posY / 32) .. "|")
  Sleep(PPS)
end
return
