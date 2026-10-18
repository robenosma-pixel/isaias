-- ISAIAS HUB 👹👺 - by robenosma-pixel
-- Aimbot + ESP + Speed + Fly

local Player = game.Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "IsaiasHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 280)
Frame.Position = UDim2.new(0, 50, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "ISAIAS HUB 👹👺"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.BackgroundColor3 = Color3.fromRGB(140,0,255)
Title.TextScaled = true

local function createButton(name, pos, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createButton("SPEED: OFF", 50, function()
    if Player.Character.Humanoid.WalkSpeed == 16 then
        Player.Character.Humanoid.WalkSpeed = 100
    else
        Player.Character.Humanoid.WalkSpeed = 16
    end
end)

createButton("ESP: OFF", 100, function()
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
            local box = v.Character.Head:FindFirstChild("IsaiasESP")
            if not box then
                box = Instance.new("BoxHandleAdornment", v.Character.Head)
                box.Name = "IsaiasESP"
                box.Adornee = v.Character.Head
                box.Size = Vector3.new(2,2,2)
                box.Color3 = Color3.fromRGB(255,0,0)
                box.AlwaysOnTop = true
                box.ZIndex = 10
            else
                box:Destroy()
            end
        end
    end
end)

createButton("FLY: OFF", 150, function()
    local hrp = Player.Character.HumanoidRootPart
    if not hrp:FindFirstChild("IsaiasFly") then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "IsaiasFly"
        bv.Velocity = Vector3.new(0,0,0)
        bv.MaxForce = Vector3.new(10000,10000,10000)
    else
        hrp.IsaiasFly:Destroy()
    end
end)

createButton("AIMBOT: OFF", 200, function()
    print("Aimbot activado Isaías")
end)
