function is_saeco(msg)
    id = load_data("vip.db")
    for k,v in pairs(id) do
    x = msg.from.id
    if tonumber(v) == x then
    return id
    end
    end
    end
-- end function 
local function run(msg,matches)
local r = get_receiver(msg)
if matches[1] == "addvip" and is_sudo(msg) then
      id = load_data("vip.db")
      table.insert(id,matches[2])
      save_data("vip.db",id)
     return "<b>User</b>" ..msg.from.id.. "<b>Added To VipList!</b>"
   end

   if matches[1] == "clearvip" and is_sudo(msg) then
   id = load_data("vip.db")
   id = {}
   save_data("vip.db",id)
   return "<b>Done!</b>"
   end

   if matches[1] == "remvip" and is_sudo(msg) then
id = load_data('vip.db')
for k,v in pairs(id) do
if v == matches[2] then
table.remove(id,k)
save_data("vip.db",id)
return "<b>User</b>" ..msg.from.id.. "<b>Removed From VipList!</b>"
end
end
end
if matches[1] == "viplist" and is_sudo(msg) then
id = load_data("vip.db")
local list = "<b>List Of Vip Users :</b>".."\n"
for k,v in pairs(id) do
list = list..(k or "").." : "..(v or "").."\n"
end
send_large_msg(r, list)
end
end
return {
    patterns = {
        "^[!/#]([Aa]ddvip) (.+)$",
        "^[!/#]([Rr]emvip) (.+)$",
        "^[!/#]([Cc]learvip)$",
        "^[!/#]([Vv]iplist)$",
        "^([Aa]ddvip) (.+)$",
        "^([Rr]emvip) (.+)$",
        "^([Cc]learvip)$",
        "^([Vv]iplist)$",
        },
    run = run,
    }
