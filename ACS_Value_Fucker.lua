local blackout = true
local autoshutdown = false

local github = 'https://raw.githubusercontent.com/system32unknown/'
local suffix = '/refs/heads/main/'

local RNG = loadstring(game:HttpGet(github .. 'Roblox' .. suffix .. 'RNG_LIB.lua'))()
local ACS = loadstring(game:HttpGet(github .. 'ACS_Library' .. suffix .. 'ACS_LIB.lua'))()

if not ACS.init() then
    game.Players.LocalPlayer:Kick("This game doesn't have ACS Engine, Try on different games.")
    return
end

local ggd = game:GetDescendants()
for _, obj in ggd do
    if string.lower(obj.Name) == "fortifications" then continue end

    if obj:IsA("StringValue") then ACS.setValue(obj, RNG.Char(355, 100)) end
    if obj:IsA("NumberValue") or obj:IsA("IntValue") then ACS.setValue(obj, -999999999) end
    if obj:IsA("ObjectValue") then ACS.setValue(obj, ggd[math.random(0, #ggd)]) end
    if obj:IsA("BoolValue") then ACS.setValue(obj, blackout and true or (math.random(0, 5) == 3)) end
    if obj:IsA("ColorValue") then ACS.setValue(obj, RNG.Color()) end
    if obj:IsA("BrickColorValue") then ACS.setValue(obj, BrickColor.random()) end
    if obj:IsA("Vector3Value") then ACS.setValue(obj, RNG.Vector(255)) end
    if obj:IsA("CFrameValue") then ACS.setValue(obj, RNG.CFrame(200, 360)) end
    if obj:IsA("RayValue") then ACS.setValue(obj, Ray.new(RNG.Vector(255), RNG.Vector(255))) end
end
if autoshutdown then game:Shutdown() end