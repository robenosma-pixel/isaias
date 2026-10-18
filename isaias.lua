-- ISAIAS HUB V8.2 FIX BY DELTERO Y EDER 👹
local Player = game:GetService("Players").LocalPlayer
local PG = Player:WaitForChild("PlayerGui")
if PG:FindFirstChild("IsaiasCredit") then PG.IsaiasCredit:Destroy() end
if PG:FindFirstChild("Rayfield") then PG.Rayfield:Destroy() end

-- LETRERO GIGANTE QUE SI APARECE 100%
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
local Stroke = Instance.new("UIStroke", CreditLabel)
Stroke.Color = Color3.fromRGB(255,255,255)
Stroke.Thickness = 2

game:GetService("Debris"):AddItem(CreditLabel, 5)
game:GetService("Debris"):AddItem(CreditGui, 6)

print("ISAIAS HUB BY DELTERO Y EDER")

-- RAYFIELD
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "ISAIAS HUB | BY DELTERO Y EDER 👹",
   Icon = 0,
   LoadingTitle = "BY DELTERO Y EDER",
   LoadingSubtitle = "ISAIAS HUB V8.2",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("🔥 Main", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
local CreditTab = Window:CreateTab("👑 BY DELTERO Y EDER", 4483362458)

CreditTab:CreateParagraph({Title = "👹 CREADORES OFICIALES", Content = "🔥 DELTERO\n🔥 EDER\n\nISAIAS HUB V8.2"})
CreditTab:CreateParagraph({Title = "GRACIAS POR USAR EL HUB", Content = "BY DELTERO Y EDER - 2026"})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local speedOn, espOn, aimOn, flyOn, jumpOn, noclipOn, hitOn = false,false,false,false,false,false,false
local flyConn, noclipConn, hitConn
local originalSizes = {}

MainTab:CreateToggle({Name = "SPEED DUELS [ANTI-KICK]", CurrentValue = false, Callback = function(v) speedOn=v end})
PlayerTab:CreateToggle({Name = "HIGH JUMP", CurrentValue = false, Callback = function(v) jumpOn=v local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.UseJumpPower=true hum.JumpPower=v and 150 or 50 end end})
MainTab:CreateToggle({Name = "FLY", CurrentValue = false, Callback = function(v) flyOn=v if v then flyConn=RunService.RenderStepped:Connect(function() local hrp=Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hrp and hum then hum.PlatformStand=true hrp.CFrame=hrp.CFrame+Camera.CFrame.LookVector*2.5 end end) else if flyConn then flyConn:Disconnect() end local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.PlatformStand=false end end end})
PlayerTab:CreateToggle({Name = "NOCLIP [FIXED]", CurrentValue = false, Callback = function(v) noclipOn=v if v then noclipConn=RunService.Stepped:Connect(function() if Player.Character then for _,p in pairs(Player.Character:GetDescendants()) do if p:IsA("BasePart") and p.CanCollide then p.CanCollide=false end end end end) else if noclipConn then noclipConn:Disconnect() end end end})
MainTab:CreateToggle({Name = "ESP", CurrentValue = false, Callback = function(v) espOn=v end})
MainTab:CreateToggle({Name = "AIMBOT LOCK", CurrentValue = false, Callback = function(v) aimOn=v end})
MainTab:CreateToggle({Name = "HITBOX GRANDE [FIXED]", CurrentValue = false, Callback = function(v) hitOn=v if v then hitConn=RunService.RenderStepped:Connect(function() for _,plr in pairs(Players:GetPlayers()) do if plr~=Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then local hrp=plr.Character.HumanoidRootPart if not originalSizes[plr] then originalSizes[plr]=hrp.Size end hrp.Size=Vector3.new(10,10,10) hrp.Transparency=0.7 hrp.CanCollide=false hrp.Massless=true end end end) else if hitConn then hitConn:Disconnect() end for _,plr in pairs(Players:GetPlayers()) do if plr~=Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then local hrp=plr.Character.HumanoidRootPart hrp.Size=originalSizes[plr] or Vector3.new(2,2,1) hrp.Transparency=0 end end originalSizes={} end end})

RunService.RenderStepped:Connect(function()
    local char=Player.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") local hum=char and char:FindFirstChild("Humanoid")
    if speedOn and hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+(hum.MoveDirection*0.28) end
    if espOn then for _,v in pairs(Players:GetPlayers()) do if v~=Player and v.Character and not v.Character:FindFirstChild("IsaiasESP") then local hl=Instance.new("Highlight",v.Character) hl.Name="IsaiasESP" hl.FillColor=Color3.fromRGB(255,0,0) end end else for _,v in pairs(Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("IsaiasESP") then v.Character.IsaiasESP:Destroy() end end end
    if aimOn then local closest,dist=nil,300 for _,v in pairs(Players:GetPlayers()) do if v~=Player and v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health>0 then local pos,onScreen=Camera:WorldToViewportPoint(v.Character.Head.Position) if onScreen then local mag=(Vector2.new(pos.X,pos.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude if mag<dist then dist=mag closest=v end end end end if closest then Camera.CFrame=CFrame.new(Camera.CFrame.Position,closest.Character.Head.Position) end end
end)

Rayfield:Notify({Title = "BY DELTERO Y EDER 👹", Content = "Hub cargado correctamente!", Duration = 6})
