writefile("AFDG.Framework.Dat",syn.request({Url="https://github.com/Zekevious/Models/raw/main/AFDG%20-%20Testing.rbxm"}).Body)
function wrap(script)
	f,Gui = loadstring(script.Source)
	print(f,Gui)
	env = setmetatable({},{__index= function(self,key) if key == "script" then return script end return getfenv()[key] end})
	setfenv(f,env)
	return f
end
Gui = game:GetObjects(getsynasset("AFDG.Framework.dat"))[1]
Gui.Parent=game.CoreGui
for i,v in pairs(Gui:GetDescendants()) do
	if v.ClassName:match("Script") then
		spawn(wrap(v))
	end
end