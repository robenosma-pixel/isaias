-- ISAIAS HUB FIX 👹👺
local Player = game.Players.LocalPlayer
local GuiParent = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", GuiParent)
ScreenGui.Name = "IsaiasHub"
ScreenGui.ResetOnSpawn = false

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
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(140,0,255)
Title.TextScaled = true

local function createButton(name, pos, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, pos)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.MouseButton1Click:Connect(callback)
    return btn
end

createButton("SPEED: 100", 50, function()
    local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = 100 end
end)

createButton("ESP: ON", 100, function()
    for _,v in pairs(game.Players:GetPlayers()) do
        if v ~= Player and v.Character and v.Character:FindFirstChild("Head") then
            if not v.Character.Head:FindFirstChild("IsaiasESP") then
                local box = Instance.new("BoxHandleAdornment", v.Character.Head)
                box.Name = "IsaiasESP"
                box.Adornee = v.Character.Head
                box.Size = Vector3.new(2,2,2)
                box.Color3 = Color3.fromRGB(255,0,0)
                box.AlwaysOnTop = true
                box.ZIndex = 10
            end
        end
    end
end)

createButton("FLY", 150, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGui/main/FlyGui.lua"))() 
end)

createButton("AIMBOT", 200, function()
    print("Aimbot Isaías")
end)
