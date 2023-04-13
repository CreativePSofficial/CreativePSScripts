Sleep(550)
SendPacket(2, [[
action|input
|text|/warn `5Script Akan Load Sebentar Lagi]])
LogToConsole("[`#Script Loading...`0]")
Sleep(3900)
LogToConsole("[`5Script Loaded `0]")
Sleep(3920)
SendPacket(2, [[
action|input
|text|/warn `p Script Telah Berjalan Selamat Menikmati Dan Jaga Dirimu Baik-Baik Jangan Terlalu Berharap Kepada Seseorang Yang Tidak Mau Menerimamu:)]])
Sleep(4000)
dialog = "add_label_with_icon|big|`bAuto Take + Drop|left|" .. 5956 .. [[
|
add_spacer|small|
add_label_with_icon|small|`0Information!|left|2480|
add_textbox|`bSource By `#@Simon |left||
add_textbox|`4Remaked By `4@BlackG |left||
add_spacer|small|
add_label_with_icon|small|`0Read This!|left|32|
add_textbox|`b- This Script On Improvement|left|
add_textbox|`b- This Script Are Free|left|
add_textbox|`b- Do Not Resell This!!|left|
add_label_with_icon|small|`0RULES!|left|1432|
add_textbox|`b- Fuck You Renamer|left|
add_textbox|`b- EAT MY CUM RENAMER|left|
add_textbox|`b- DONT RENAME & STEAL LOL|left|
add_textbox|`b- REMAKED BY BLACKGCH|left|
add_textbox|`b- #BlackG|left|
add_spacer|small|
add_button||                       Continue!                       |]]
var = {}
var.v0 = "OnDialogRequest"
var.v1 = dialog
SendVariant(var)
Sleep(500)
LogToConsole("[`5Wait.. `0]")
Sleep(6300)
function hook(k)
  if k.v1 == "OnDialogRequest" then
    return true
  else
    return false
  end
end
AddHook(hook, "OnVariant")
while true do
  SendPacket(2, [[
action|dialog_return
dialog_name|magplant_edit
x|]] .. x .. [[
|
y|]] .. y .. [[
|
buttonClicked|withdraw]])
  Sleep(175)
  SendPacket(2, [[
action|drop|
itemID|]] .. itemID .. "|")
  SendPacket(2, [[
action|dialog_return
dialog_name|drop|
item_drop|]] .. itemID2 .. [[
|
item_count|250|
buttonClicked|OK]])
  Sleep(175)
end
