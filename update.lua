

local shell = require("shell")
local internet = require("internet")


--downloading the json libs if they do not exsist
shell.execute('mkdir /api')
shell.execute('wget -fq "https://raw.githubusercontent.com/rater193/OpenComputers-1.7.10-Base-Monitor/master/api/json.lua" "/api/json.lua"')

--api calls
dofile("/api/json.lua")

--now we get the data from the git repository
local request, responce = pcall(internet.request, "https://api.github.com/repos/rater193/OpenComputers-1.7.10-Base-Monitor/git/refs")

if(request) then
	print("request: "..tostring(request))
	local data = responce()

	print("data: "..tostring(data))
	git = decode(data)[1].object
	
	--[[
		sha
		type
		url
	]]

	--This is the version ID we are going to compare, to see if we are outdated!
	local newversion = git.sha
	--this is the repositories commit api url
	local gitcommit = git.url

	local request, responce = pcall(internet.request, gitcommit)

	if(request) then
		local commitdata = responce()

		print("commitdata: "..tostring(decode(commitdata)))
	else
		print("Unable to get project commit, err:"..tostring(responce))
	end


	--[[for _, v in pairs(git) do
		print(tostring(_), " = ", tostring(v))
	end]]

else
	print("Unable to get update details, err:"..tostring(responce))
end
