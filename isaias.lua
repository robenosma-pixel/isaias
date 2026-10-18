-- ISAIAS HUB V8 RAYFIELD REAL + FIX NOCLIP/HITBOX 👹
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ISAIAS HUB V8 | DUELS 👹👺",
   Icon = 0,
   LoadingTitle = "Isaias Hub",
   LoadingSubtitle = "by Isaias 👹",
   Theme = "Amethyst",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("🔥 Main", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local speedOn, espOn, aimOn, flyOn, jumpOn, noclipOn, hitOn = false,false,false,false,false,false,false
local flyConn, noclipConn, hitConn
local originalSizes = {}

-- SPEED DUELS ANTI-KICK
MainTab:CreateToggle({
   Name = "SPEED DUELS [ANTI-KICK]",
   CurrentValue = false,
   Callback = function(v) speedOn = v end,
})

-- HIGH JUMP
PlayerTab:CreateToggle({
   Name = "HIGH JUMP",
   CurrentValue = false,
   Callback = function(v) 
       jumpOn = v
       local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
       if hum then hum.UseJumpPower = true hum.JumpPower = v and 150 or 50 end
   end,
})

-- FLY
MainTab:CreateToggle({
   Name = "FLY",
   CurrentValue = false,
   Callback = function(v)
       flyOn = v
       if v then
           flyConn = RunService.RenderStepped:Connect(function()
               local char = Player.Character
               local hrp = char and char:FindFirstChild("HumanoidRootPart")
               local hum = char and char:FindFirstChild("Humanoid")
               if hrp and hum then hum.PlatformStand = true hrp.CFrame = hrp.CFrame + Camera.CFrame.LookVector * 2.5 end
           end)
       else
           if flyConn then flyConn:Disconnect() end
           local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
           if hum then hum.PlatformStand = false end
       end
   end,
})

-- NOCLIP FIX
PlayerTab:CreateToggle({
   Name = "NOCLIP [FIXED]",
   CurrentValue = false,
   Callback = function(v)
       noclipOn = v
       if v then
           noclipConn = RunService.Stepped:Connect(function()
               if Player.Character then
                   for _,part in pairs(Player.Character:GetDescendants()) do
                       if part:IsA("BasePart") and part.CanCollide == true then
                           part.CanCollide = false
                       end
                   end
               end
           end)
       else
           if noclipConn then noclipConn:Disconnect() end
           if Player.Character then
               for _,part in pairs(Player.Character:GetDescendants()) do
                   if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                       -- deja que roblox lo regrese solo
                   end
               end
           end
       end
   end,
})

-- ESP
MainTab:CreateToggle({
   Name = "ESP ENEMIGO",
   CurrentValue = false,
   Callback = function(v) espOn = v end,
})

-- AIMBOT
MainTab:CreateToggle({
   Name = "AIMBOT LOCK DUELS",
   CurrentValue = false,
   Callback = function(v) aimOn = v end,
})

-- HITBOX FIX (EL QUE NO FUNCIONABA)
MainTab:CreateToggle({
   Name = "HITBOX GRANDE [FIXED]",
   CurrentValue = false,
   Callback = function(v)
       hitOn = v
       if v then
           hitConn = RunService.RenderStepped:Connect(function()
               for _,plr in pairs(Players:GetPlayers()) do
                   if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                       local hrp = plr.Character.HumanoidRootPart
                       if not originalSizes[plr] then originalSizes[plr] = hrp.Size end
                       hrp.Size = Vector3.new(10,10,10)
                       hrp.Transparency = 0.7
                       hrp.CanCollide = false
                       hrp.Massless = true
                   end
               end
           end)
       else
           if hitConn then hitConn:Disconnect() end
           for _,plr in pairs(Players:GetPlayers()) do
               if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                   local hrp = plr.Character.HumanoidRootPart
                   hrp.Size = originalSizes[plr] or Vector3.new(2,2,1)
                   hrp.Transparency = 0
               end
           end
           originalSizes = {}
       end
   end,
})

-- LOOPS PRINCIPALES
RunService.RenderStepped:Connect(function()
    local char = Player.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")

    if speedOn and hrp and hum and hum.MoveDirection.Magnitude > 0 then
        hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 0.28)
    end

    if espOn then
        for _,v in pairs(Players:GetPlayers()) do
            if v~=Player and v.Character and not v.Character:FindFirstChild("IsaiasESP") then
                local hl = Instance.new("Highlight", v.Character)
                hl.Name = "IsaiasESP"
                hl.FillColor = Color3.fromRGB(255,0,0)
                hl.OutlineColor = Color3.fromRGB(255,255,255)
                hl.FillTransparency = 0.5
            end
        end
    else
        for _,v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("IsaiasESP") then v.Character.IsaiasESP:Destroy() end
        end
    end

    if aimOn then
        local closest, dist = nil, 300
        for _,v in pairs(Players:GetPlayers()) do
            if v~=Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local pos,onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local mag = (Vector2.new(pos.X,pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if mag < dist then dist = mag closest = v end
                end
            end
        end
        if closest then Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Character.Head.Position) end
    end
end)

Player.CharacterAdded:Connect(function(c)
    c:WaitForChild("Humanoid")
    wait(0.5)
    if jumpOn then c.Humanoid.UseJumpPower = true c.Humanoid.JumpPower = 150 end
end)

Rayfield:Notify({Title = "ISAIAS HUB V8", Content = "Rayfield cargado! Noclip y Hitbox arreglados 👹", Duration = 5})
