-- BY DELTERO Y EDER V10.5 ANTI-KICK - 100% FIX
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PG = Player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

for _,v in pairs(PG:GetChildren()) do if v.Name=="IsaiasHubV10" then v:Destroy() end end

local Gui = Instance.new("ScreenGui", PG)
Gui.Name = "IsaiasHubV10"
Gui.ResetOnSpawn = false

-- CREDIT ARRIBA
local Credit = Instance.new("TextLabel", Gui)
Credit.Size = UDim2.new(0,350,0,45)
Credit.Position = UDim2.new(0.5,-175,0,10)
Credit.Text = "BY DELTERO Y EDER 👹🔥 V10.5"
Credit.BackgroundColor3 = Color3.fromRGB(0,0,0)
Credit.TextColor3 = Color3.fromRGB(255,0,0)
Credit.TextScaled = true
Credit.Font = Enum.Font.GothamBlack
Instance.new("UICorner", Credit).CornerRadius = UDim.new(0,10)
local stroke = Instance.new("UIStroke", Credit) stroke.Color = Color3.fromRGB(140,0,255) stroke.Thickness=2

-- BOTON ROJO SNAP MOVIBLE
local SnapBtn = Instance.new("TextButton", Gui)
SnapBtn.Size = UDim2.new(0,80,0,80)
SnapBtn.Position = UDim2.new(0,20,0.55,0)
SnapBtn.Text = "SNAP"
SnapBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
SnapBtn.TextColor3 = Color3.new(1,1,1)
SnapBtn.TextScaled = true
SnapBtn.Font = Enum.Font.GothamBlack
SnapBtn.Draggable = true
SnapBtn.Active = true
Instance.new("UICorner", SnapBtn).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", SnapBtn).Color = Color3.new(1,1,1)

local snapUnder = false
local savedPos = nil
SnapBtn.MouseButton1Click:Connect(function()
    local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if not snapUnder then
        savedPos = hrp.CFrame
        hrp.CFrame = CFrame.new(hrp.Position - Vector3.new(0,25,0))
        SnapBtn.Text = "UP"
        SnapBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
        snapUnder = true
    else
        hrp.CFrame = savedPos and savedPos + Vector3.new(0,5,0) or CFrame.new(hrp.Position + Vector3.new(0,30,0))
        SnapBtn.Text = "SNAP"
        SnapBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
        snapUnder = false
    end
end)

-- MENU PRINCIPAL
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,260,0,440)
Main.Position = UDim2.new(0.5,-130,0.5,-160)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(140,0,255)

local Top = Instance.new("TextLabel", Main)
Top.Size = UDim2.new(1,0,0,40)
Top.Text = "ISAIAS HUB | DELTERO Y EDER"
Top.BackgroundColor3 = Color3.fromRGB(140,0,255)
Top.TextColor3 = Color3.new(1,1,1)
Top.TextScaled = true
Top.Font = Enum.Font.GothamBold
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,12)

local function newBtn(txt,y)
    local b=Instance.new("TextButton",Main)
    b.Size=UDim2.new(0,240,0,35)
    b.Position=UDim2.new(0,10,0,y)
    b.Text=txt.." ❌"
    b.BackgroundColor3=Color3.fromRGB(30,30,30)
    b.TextColor3=Color3.new(1,1,1)
    b.Font=Enum.Font.GothamBold
    b.TextScaled=true
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    return b
end

local b1=newBtn("SPEED DUELS BYPASS",50)
local b2=newBtn("ESP",90)
local b3=newBtn("AIMBOT SUAVE",130)
local b4=newBtn("HITBOX SAFE 3.5",170)
local b5=newBtn("FLY",210)
local b6=newBtn("HIGH JUMP",250)
local b7=newBtn("NOCLIP",290)
local b8=newBtn("INVISIBLE",330)
local b9=newBtn("TP RANDOM",370)
local b10=newBtn("CERRAR MENU",410)

local s={false,false,false,false,false,false,false,false}
local flyConn,noclipConn

local function tog(btn,on) btn.Text=btn.Text:gsub(" ❌",""):gsub(" ✅","")..(on and " ✅" or " ❌") btn.BackgroundColor3=on and Color3.fromRGB(0,180,0) or Color3.fromRGB(30,30,30) end

-- SPEED BYPASS (NO WALKSPEED PARA NO KICK)
b1.MouseButton1Click:Connect(function() s[1]=not s[1] tog(b1,s[1]) end)
b2.MouseButton1Click:Connect(function() s[2]=not s[2] tog(b2,s[2]) end)
b3.MouseButton1Click:Connect(function() s[3]=not s[3] tog(b3,s[3]) end)
b4.MouseButton1Click:Connect(function() s[4]=not s[4] tog(b4,s[4]) end)

b5.MouseButton1Click:Connect(function() 
    s[5]=not s[5] tog(b5,s[5])
    if s[5] then flyConn=RunService.RenderStepped:Connect(function() local hrp=Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hrp and hum then hum.PlatformStand=true hrp.CFrame=hrp.CFrame+Camera.CFrame.LookVector*2.5 end end) else if flyConn then flyConn:Disconnect() end local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.PlatformStand=false end end
end)
b6.MouseButton1Click:Connect(function() s[6]=not s[6] tog(b6,s[6]) local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then
