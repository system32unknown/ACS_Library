local buildLoop = 20

local github = 'https://raw.githubusercontent.com/system32unknown/'
local suffix = '/refs/heads/main/'

local RNG = loadstring(game:HttpGet(github .. 'Roblox' .. suffix .. 'RNG_LIB.lua'))()
local ACS = loadstring(game:HttpGet(github .. 'ACS_Library' .. suffix .. 'ACS_LIB.lua'))()

if not ACS.init() then
    game.Players.LocalPlayer:Kick("This game doesn't have ACS Engine, Try on different games.")
	return
end

ACS.bypassbuild()
for _ = 0, buildLoop do
    ACS.build(RNG.CFrame(200, 360), RNG.CFrame(200, 360), RNG.Vector(255))
end