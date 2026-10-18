-- ISAIAS HUB V10 FINAL BY DELTERO Y EDER - TODO FIX + SNAP ROJO
local Player = game:GetService("Players").LocalPlayer
local PG = Player:WaitForChild("PlayerGui")
for _,v in pairs(PG:GetChildren()) do if v.Name=="IsaiasCredit" or v.Name=="Rayfield" or v.Name=="SnapBtnGui" then v:Destroy() end end

-- LETRERO BY DELTERO Y EDER
local CreditGui = Instance.new("ScreenGui", PG)
CreditGui.Name = "IsaiasCredit"
CreditGui.ResetOnSpawn = false
local CreditLabel = Instance.new("TextLabel", CreditGui)
CreditLabel.Size = UDim2.new(0,400,0,80)
CreditLabel.Position = UDim2.new(0.5,-200,0.15,0)
CreditLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
CreditLabel.Text = "BY DELTERO Y EDER 👹🔥"
CreditLabel.TextColor3 = Color3.fromRGB(255,0,0)
CreditLabel.TextScaled = true
CreditLabel.Font = Enum.Font.GothamBlack
Instance.new("UICorner", CreditLabel).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", CreditLabel).Color = Color3.new(1,1,1)
game:GetService("Debris"):AddItem(CreditLabel, 5)
game:GetService("Debris"):AddItem(CreditGui, 6)

-- BOTON ROJO SNAP MOVIBLE
local SnapGui = Instance.new("ScreenGui", PG)
SnapGui.Name = "SnapBtnGui"
SnapGui.ResetOnSpawn = false

local SnapBtn = Instance.new("TextButton", SnapGui)
SnapBtn.Size = UDim2.new(0,90,0,90)
SnapBtn.Position = UDim2.new(0,20,0.6,0)
SnapBtn.Text = "SNAP"
SnapBtn.TextScaled = true
SnapBtn.Font = Enum.Font.GothamBlack
SnapBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
SnapBtn.TextColor3 = Color3.new(1,1,1)
SnapBtn.Draggable = true
SnapBtn.Active = true
Instance.new("UICorner", SnapBtn).CornerRadius = UDim.new(1,0)
local SStroke = Instance.new("UIStroke", SnapBtn)
SStroke.Color = Color3.fromRGB(255,255,255)
SStroke.Thickness = 3

local snapUnder = false
local savedPos = nil
SnapBtn.MouseButton1Click:Connect(function()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if not snapUnder then
        savedPos = hrp.CFrame
        hrp.CFrame = hrp.CFrame - Vector3.new(0,25,0)
        SnapBtn.Text = "UP"
        SnapBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
        snapUnder = true
    else
        if savedPos then hrp.CFrame = savedPos + Vector3.new(0,5,0) else hrp.CFrame = hrp.CFrame + Vector3.new(0,30,0) end
        SnapBtn.Text = "SNAP"
        SnapBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
        snapUnder = false
    end
end)

-- RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ISAIAS HUB V10 | BY DELTERO Y EDER 👹",
   Icon = 0,
   LoadingTitle = "BY DELTERO Y EDER",
   LoadingSubtitle = "V10 FIX TOTAL",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("🔥 Main", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
local TPTab = Window:CreateTab("🚀 Teleport", 4483362458)
local CreditTab = Window:CreateTab("👑 BY DELTERO Y EDER", 4483362458)

CreditTab:CreateParagraph({Title = "CREADORES", Content = "🔥 DELTERO\n🔥 EDER\n\nBOTON ROJO SNAP = BAJO MAPA"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local speedOn, espOn, aimOn, flyOn, jumpOn, noclipOn, hitOn = false,false,false,false,false,false,false
local flyConn, noclipConn, hitConn
local originalSizes = {}

-- TP FIX
local selectedPlayer = nil
local Dropdown = TPTab:CreateDropdown({
   Name = "Jugador a teletransportar",
   Options = (function() local l={} for _,p in pairs(Players:GetPlayers()) do if p~=Player then table.insert(l,p.Name) end end return l end)(),
   CurrentOption = "",
   Flag = "TPDropdown",
   Callback = function(opt) selectedPlayer = opt[1] print("Seleccionado: "..selectedPlayer) end,
})

TPTab:CreateButton({
   Name = "🚀 TELETRANSPORTARME AHORA",
   Callback = function()
       if not selectedPlayer then Rayfield:Notify({Title="Error",Content="Selecciona jugador primero",Duration=3}) return end
       local target = Players:FindFirstChild(selectedPlayer)
       if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
           local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
           if hrp then
               hrp.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(0,3,2))
               Rayfield:Notify({Title="TP",Content="TP a "..
