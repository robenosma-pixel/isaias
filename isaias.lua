-- ISAIAS HUB V4 ANTI-CHEAT + FLY REAL 👹👺
local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local GuiParent = Player:WaitForChild("PlayerGui")
if GuiParent:FindFirstChild("IsaiasHub") then GuiParent.IsaiasHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", GuiParent)
ScreenGui.Name = "IsaiasHub"
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 210)
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "ISAIAS HUB V4 👹👺"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(140,0,255)
Title.TextScaled = true

local speedOn, espOn, flyOn, aimOn = false, false, false, false

local function createButton(name, pos)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 180, 0, 35)
    btn.Position = UDim2.new(0, 10, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    return btn
end

local speedBtn = createButton("SPEED: OFF", 40)
local espBtn = createButton("ESP: OFF", 80)
local flyBtn = createButton("FLY: OFF", 120)
local aimBtn = createButton("AIMBOT: OFF", 160)

-- SPEED BYPASS (No usa WalkSpeed, usa CFrame para que no te regrese)
spawn(function()
    while wait() do
        if speedOn then
            local char = Player.Character
            local hum = char and char:FindFirstChild("Humanoid")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hum and hrp and hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection * 2.5) -- Corre rápido sin ser detectado
            end
        end
    end
end)

speedBtn.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    speedBtn.Text = speedOn and "SPEED: ON" or "SPEED: OFF"
    speedBtn.BackgroundColor3 = speedOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
end)

espBtn.MouseButton1Click:Connect(function()
    espOn = not espOn
    espBtn.Text = espOn and "ESP: ON" or "ESP: OFF"
    espBtn.BackgroundColor3 = espOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= Player and v.Character then
            if espOn then
                if not v.Character:FindFirstChild("IsaiasESP") then
                    local hl = Instance.new("Highlight", v.Character)
                    hl.Name = "IsaiasESP"
                    hl.FillColor = Color3.fromRGB(255,0,0)
                end
            else
                if v.Character:FindFirstChild("IsaiasESP") then v.Character.IsaiasESP:Destroy() end
            end
        end
    end
end)

-- FLY REAL QUE SI VUELA (para celular)
local flyConn
flyBtn.MouseButton1Click:Connect(function()
    flyOn = not flyOn
    flyBtn.Text = flyOn and "FLY: ON" or "FLY: OFF"
    flyBtn.BackgroundColor3 = flyOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
    if flyOn then
        flyConn = RunService.RenderStepped:Connect(function()
            local char = Player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if hrp and hum then
                hum.PlatformStand = true
                -- Si mueves el joystick vuela hacia donde miras
                if hum.MoveDirection.Magnitude > 0 then
                    hrp.CFrame = hrp.CFrame + (Camera.CFrame.LookVector * 2.5)
                else
                    -- Si no te mueves, te quedas flotando en el aire
                    hrp.CFrame = hrp.CFrame + Vector3.new(0,0.1,0)
                end
            end
        end)
    else
        if flyConn then flyConn:Disconnect() end
        local char = Player.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end)

aimBtn.MouseButton1Click:Connect(function()
    aimOn = not aimOn
    aimBtn.Text = aimOn and "AIMBOT: ON" or "AIMBOT: OFF"
    aimBtn.BackgroundColor3 = aimOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
end)

RunService.RenderStepped:Connect(function()
    if aimOn then
        local closest, dist = nil, 9999
        for _,v in pairs(game.Players:GetPlayers()) do
            if v ~= Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local mag = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if mag < dist then dist = mag closest = v end
                end
            end
        end
        if closest and closest.Character and closest.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Character.Head.Position)
        end
    end
end)
