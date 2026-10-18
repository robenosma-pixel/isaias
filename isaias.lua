-- ISAIAS HUB V5 CIRCULO + ANTI-RESET 👹
local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local GuiParent = Player:WaitForChild("PlayerGui")
if GuiParent:FindFirstChild("IsaiasHub") then GuiParent.IsaiasHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", GuiParent)
ScreenGui.Name = "IsaiasHub"
ScreenGui.ResetOnSpawn = false

-- BOTON CIRCULAR CON EMOJI 👹
local CircleBtn = Instance.new("TextButton", ScreenGui)
CircleBtn.Size = UDim2.new(0, 60, 0, 60)
CircleBtn.Position = UDim2.new(0, 20, 0.5, 0)
CircleBtn.Text = "👹"
CircleBtn.TextScaled = true
CircleBtn.BackgroundColor3 = Color3.fromRGB(140,0,255)
CircleBtn.TextColor3 = Color3.new(1,1,1)
CircleBtn.Active = true
CircleBtn.Draggable = true
local Corner = Instance.new("UICorner", CircleBtn)
Corner.CornerRadius = UDim.new(1,0)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 210)
Frame.Position = UDim2.new(0, 20, 0, 100)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Visible = false -- Empieza cerrado

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "ISAIAS HUB V5 👹"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(140,0,255)
Title.TextScaled = true

CircleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

local speedOn, espOn, flyOn, aimOn = false, false, false, false
local flyConn
local char, hrp, hum

local function updateChar()
    char = Player.Character or Player.CharacterAdded:Wait()
    hrp = char:WaitForChild("HumanoidRootPart")
    hum = char:WaitForChild("Humanoid")
end

updateChar()
Player.CharacterAdded:Connect(function()
    updateChar()
    -- Espera 1 seg y reactiva lo que tenias activado
    wait(1)
    if flyOn and hum then hum.PlatformStand = true end
end)

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
           
