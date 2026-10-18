-- ISAIAS HUB V9 BY DELTERO Y EDER - TP + INVISIBLE
local Player = game:GetService("Players").LocalPlayer
local PG = Player:WaitForChild("PlayerGui")
if PG:FindFirstChild("IsaiasCredit") then PG.IsaiasCredit:Destroy() end
if PG:FindFirstChild("Rayfield") then PG.Rayfield:Destroy() end

local CreditGui = Instance.new("ScreenGui", PG)
CreditGui.Name = "IsaiasCredit"
CreditGui.ResetOnSpawn = false
local CreditLabel = Instance.new("TextLabel", CreditGui)
CreditLabel.Size = UDim2.new(0,400,0,80)
CreditLabel.Position = UDim2.new(0.5,-200,0.2,0)
CreditLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
CreditLabel.BackgroundTransparency = 0.2
CreditLabel.Text = "BY DELTERO Y EDER 👹🔥"
CreditLabel.TextColor3 = Color3.fromRGB(140,0,255)
CreditLabel.TextScaled = true
CreditLabel.Font = Enum.Font.GothamBlack
Instance.new("UICorner", CreditLabel).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", CreditLabel).Thickness = 2
game:GetService("Debris"):AddItem(CreditLabel, 4)
game:GetService("Debris"):AddItem(CreditGui, 5)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "ISAIAS HUB | BY DELTERO Y EDER 👹",
   Icon = 0,
   LoadingTitle = "BY DELTERO Y EDER",
   LoadingSubtitle = "V9 - TP + INVISIBLE",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("🔥 Main", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
local TPTab = Window:CreateTab("🚀 Teleport", 4483362458)
local CreditTab = Window:CreateTab("👑 BY DELTERO Y EDER", 4483362458)

CreditTab:CreateParagraph({Title = "👹 CREADORES", Content = "🔥 DELTERO\n🔥 EDER"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local speedOn, espOn, aimOn, flyOn, jumpOn, noclipOn, hitOn, invisOn = false,false,false,false,false,false,false,false
local flyConn, noclipConn, hitConn
local originalSizes = {}

-- FUNCIONES NUEVAS

-- 1. TELEPORT A JUGADOR
local selectedPlayer = nil
local function getPlayerList()
    local list = {}
    for _,p in pairs(Players:GetPlayers()) do if p ~= Player then table.insert(list, p.Name) end end
    return list
end

local PlayerDropdown = TPTab:CreateDropdown({
   Name = "Selecciona Jugador para TP",
   Options = getPlayerList(),
   CurrentOption = "",
   Callback = function(opt) selectedPlayer = opt[1] end,
})

TPTab:CreateButton({
   Name = "🚀 TELETRANSPORTARTE AL JUGADOR",
   Callback = function()
       if selectedPlayer then
           local target = Players:FindFirstChild(selectedPlayer)
           if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
               Player.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
               Rayfield:Notify({Title = "TP", Content = "TP a "..selectedPlayer.." exitoso!", Duration = 3})
           end
       else
           Rayfield:Notify({Title = "Error", Content = "Selecciona un jugador primero", Duration = 3})
       end
   end,
})

TPTab:CreateButton({
   Name = "🔄 Actualizar lista de jugadores",
   Callback = function() PlayerDropdown:Refresh(getPlayerList()) end,
})

-- 2. INVISIBILIDAD
PlayerTab:CreateToggle({
   Name = "INVISIBILIDAD 👻",
   CurrentValue = false,
   Callback = function(v)
       invisOn = v
       if v then
           if Player.Character then
               for _,part in pairs(Player.Character:GetDescendants()) do
                   if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                       part.Transparency = 1
                   elseif part:IsA("Decal") or part:IsA("Texture") then
                       part.Transparency = 1
                   end
               end
               if Player.Character:FindFirstChild("Head") and Player.Character.Head:FindFirstChild("face") then
                   Player.Character.Head.face.Transparency = 1
               end
           end
           Rayfield:Notify({Title = "Invisible", Content = "Eres invisible 👻 BY DELTERO Y EDER", Duration = 3})
       else
           if Player.Character then
               for _,part in pairs(Player.Character:GetDescendants()) do
                   if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                       part.Transparency = 0
                   elseif part:IsA("Decal") or part:IsA("Texture") then
                       part.Transparency = 0
                   end
               end
               if Player.Character:FindFirstChild("Head") and Player.Character.Head:FindFirstChild("face") then
                   Player.Character.Head.face.Transparency = 0
               end
           end
       end
   end,
})

-- LO DEM
