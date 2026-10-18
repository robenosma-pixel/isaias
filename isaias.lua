-- ISAIAS HUB V6 CIRCULO + HIGH JUMP 👹👺
local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local PG = Player:WaitForChild("PlayerGui")
if PG:FindFirstChild("IsaiasHub") then PG.IsaiasHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", PG)
ScreenGui.Name = "IsaiasHub"
ScreenGui.ResetOnSpawn = false

-- CIRCULO 👹
local CircleBtn = Instance.new("TextButton", ScreenGui)
CircleBtn.Size = UDim2.new(0, 65, 0, 65)
CircleBtn.Position = UDim2.new(0, 20, 0, 20)
CircleBtn.Text = "👹"
CircleBtn.TextScaled = true
CircleBtn.BackgroundColor3 = Color3.fromRGB(140,0,255)
CircleBtn.TextColor3 = Color3.new(1,1,1)
CircleBtn.Draggable = true
CircleBtn.Active = true
Instance.new("UICorner", CircleBtn).CornerRadius = UDim.new(1,0)

-- MENU
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 260)
Frame.Position = UDim2.new(0, 20, 0, 90)
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Visible = true -- AHORA YA APARECE AL INICIO
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "ISAIAS V6 👹👺"
Title.BackgroundColor3 = Color3.fromRGB(140,0,255)
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true

CircleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

local speedOn, flyOn, aimOn, espOn, jumpOn = false, false, false, false, false
local flyConn

local function btn(name,pos)
    local b=Instance.new("TextButton",Frame)
    b.Size=UDim2.new(0,180,0,35)
    b.Position=UDim2.new(0,10,0,pos)
    b.Text=name
    b.BackgroundColor3=Color3.fromRGB(40,40,40)
    b.TextColor3=Color3.new(1,1,1)
    b.TextScaled=true
    return b
end

local speedBtn=btn("SPEED: OFF",40)
local espBtn=btn("ESP: OFF",80)
local flyBtn=btn("FLY: OFF",120)
local aimBtn=btn("AIMBOT: OFF",160)
local jumpBtn=btn("HIGH JUMP: OFF",200)

speedBtn.MouseButton1Click:Connect(function() speedOn=not speedOn speedBtn.Text=speedOn and "SPEED: ON" or "SPEED: OFF" speedBtn.BackgroundColor3=speedOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40) end)
espBtn.MouseButton1Click:Connect(function() espOn=not espOn espBtn.Text=espOn and "ESP: ON" or "ESP: OFF" espBtn.BackgroundColor3=espOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40) end)

flyBtn.MouseButton1Click:Connect(function()
    flyOn=not flyOn flyBtn.Text=flyOn and "FLY: ON" or "FLY: OFF" flyBtn.BackgroundColor3=flyOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
    if flyOn then
        flyConn=RunService.RenderStepped:Connect(function()
            local c=Player.Character local hrp=c and c:FindFirstChild("HumanoidRootPart") local hum=c and c:FindFirstChild("Humanoid")
            if hrp and hum then hum.PlatformStand=true if hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+(Camera.CFrame.LookVector*3) else hrp.CFrame=hrp.CFrame+Vector3.new(0,0.3,0) end end
        end)
    else if flyConn then flyConn:Disconnect() end local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.PlatformStand=false end end
end)

aimBtn.MouseButton1Click:Connect(function() aimOn=not aimOn aimBtn.Text=aimOn and "AIMBOT: ON" or "AIMBOT: OFF" aimBtn.BackgroundColor3=aimOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40) end)

jumpBtn.MouseButton1Click:Connect(function()
    jumpOn=not jumpOn
    jumpBtn.Text=jumpOn and "HIGH JUMP: ON" or "HIGH JUMP: OFF"
    jumpBtn.BackgroundColor3=jumpOn and Color3.fromRGB(0,170,0) or Color3.fromRGB(40,40,40)
    local hum = Player.Character and Player.Character:FindFirstChild("Humanoid")
    if hum then
        hum.JumpPower = jumpOn and 200 or 50
        hum.UseJumpPower = true
    end
end)

-- Evita que se resetee al morir
Player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    wait(1)
    if jumpOn then char.Humanoid.JumpPower = 200 char.Humanoid.UseJumpPower = true end
end)

RunService.RenderStepped:Connect(function()
    if speedOn then local c=Player.Character local hrp=c and c:FindFirstChild("HumanoidRootPart") local hum=c and c:FindFirstChild("Humanoid") if hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+(hum.MoveDirection*2.8) end end
    if aimOn then local cl,ds=nil,400 for _,v in pairs(game.Players:GetPlayers()) do if v~=Player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health>0 then local pos,os=Camera:WorldToViewportPoint(v.Character.Head.Position) if os then local m=(Vector2.new(pos.X,pos.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude if m<ds then ds=m cl=v end end end end if cl then Camera.CFrame=CFrame.new(Camera.CFrame.Position,cl.Character.Head.Position) end end
end)
