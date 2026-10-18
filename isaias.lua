-- ISAIAS HUB V8.1 RAYFIELD - BY DELTERO Y EDER 👹
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ISAIAS HUB | BY DELTERO Y EDER 👹👺",
   Icon = 0,
   LoadingTitle = "ISAIAS HUB V8.1",
   LoadingSubtitle = "by Deltero y Eder",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("🔥 Main", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
local CreditTab = Window:CreateTab("👑 Creditos", 4483362458)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- CREDITOS AL EJECUTAR
CreditTab:CreateParagraph({Title = "👹 CREADORES", Content = "Este hub fue creado por:\n\n🔥 DELTERO\n🔥 EDER\n\nGracias por usar ISAIAS HUB"})
MainTab:CreateParagraph({Title = "BY DELTERO Y EDER", Content = "Version TikTok V8.1"})

local speedOn, espOn, aimOn, flyOn, jumpOn, noclipOn, hitOn = false,false,false,false,false,false,false
local flyConn, noclipConn, hitConn
local originalSizes = {}

MainTab:CreateToggle({Name = "SPEED DUELS [ANTI-KICK]", CurrentValue = false, Callback = function(v) speedOn = v end})
PlayerTab:CreateToggle({Name = "HIGH JUMP", CurrentValue = false, Callback = function(v) jumpOn=v local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.UseJumpPower=true hum.JumpPower=v and 150 or 50 end end})
MainTab:CreateToggle({Name = "FLY", CurrentValue = false, Callback = function(v) flyOn=v if v then flyConn=RunService.RenderStepped:Connect(function() local char=Player.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") local hum=char and char:FindFirstChild("Humanoid") if hrp and hum then hum.PlatformStand=true hrp.CFrame=hrp.CFrame+Camera.CFrame.LookVector*2.5 end end) else if flyConn then flyConn:Disconnect() end local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.PlatformStand=false end end end})
PlayerTab:CreateToggle({Name = "NOCLIP [FIXED]", CurrentValue = false, Callback = function(v) noclipOn=v if v then noclipConn=RunService.Stepped:Connect(function() if Player.Character then for _,part in pairs(Player.Character:GetDescendants()) do if part:IsA("BasePart") and
