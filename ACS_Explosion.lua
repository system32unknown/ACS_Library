local PS = game:GetService("Players")
function getRoot(char):Part
	return char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
end

local github = 'https://raw.githubusercontent.com/system32unknown/'
local suffix = '/refs/heads/main/'

local ACS = loadstring(game:HttpGet(github .. 'ACS_Library' .. suffix .. 'ACS_LIB.lua'))()

if not ACS.init('ACS_Engine') then
    game.Players.LocalPlayer:Kick("This game doesn't have ACS Engine, Try on different games.")
    return
end

for _, p in PS:GetPlayers() do
    local p_char = p.Character
    if p_char == nil then continue end

    local p_vector:Vector3 = getRoot(p_char).Position
    if ACS.newACS then
        ACS.hitfx(p_vector)
    else
        ACS.explode(p_vector)
    end
end