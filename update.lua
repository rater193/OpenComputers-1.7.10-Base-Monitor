

local shell = require("shell")
shell.execute('mkdir /api')
shell.execute('wget "https://raw.githubusercontent.com/rater193/OpenComputers-1.7.10-Base-Monitor/master/api/json.lua" "/api/json.lua"')