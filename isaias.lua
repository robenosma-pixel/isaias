-- ISAIAS HUB V7 TIKTOK EDITION 👹🔥
local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local PG = Player:WaitForChild("PlayerGui")
if PG:FindFirstChild("IsaiasHub") then PG.IsaiasHub:Destroy() end

local Gui = Instance.new("ScreenGui", PG)
Gui.Name = "IsaiasHub"
Gui.ResetOnSpawn = false

local Circle = Instance.new("TextButton", Gui)
Circle.Size = UDim2.new(0,70,0,70)
Circle.Position = UDim2.new(0,15,0.4,0)
Circle.Text = "👹"
Circle.TextScaled = true
Circle.BackgroundColor3 = Color3.fromRGB(0,0,0)
Circle.TextColor3 = Color3.new(1,1,1)
Circle.Draggable = true
Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)
local Stroke = Instance.new("UIStroke", Circle)
Stroke.Color = Color3.fromRGB(140,0,255)
Stroke.Thickness = 3

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0,250,0,380)
Main.Position = UDim2.new(0.5,-125,0.5,-190)
Main.BackgroundColor3 = Color3.fromRGB(10,10,10)
Main.Visible = true
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,12)
local MStroke = Instance.new("UIStroke", Main)
MStroke.Color = Color3.fromRGB(140,0,255)
MStroke.Thickness = 2

local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,50)
Top.BackgroundColor3 = Color3.fromRGB(140,0,255)
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,12)
local TopText = Instance.new("TextLabel", Top)
TopText.Size = UDim2.new(1,0,1,0)
TopText.Text = "ISAIAS HUB | TIKTOK 🔥"
TopText.BackgroundTransparency = 1
TopText.TextColor3 = Color3.new(1,1,1)
TopText.TextScaled = true
TopText.Font = Enum.Font.GothamBold

local function addBtn(txt,y)
    local b=Instance.new("TextButton",Main)
    b.Size=UDim2.new(0,230,0,38)
    b.Position=UDim2.new(0,10,0,y)
    b.Text=txt.." ❌"
    b.BackgroundColor3=Color3.fromRGB(25,25,25)
    b.TextColor3=Color3.new(1,1,1)
    b.Font=Enum.Font.GothamBold
    b.TextScaled=true
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,8)
    return b
end

local btns = {
    addBtn("SPEED DUELS",60),
    addBtn("ESP",105),
    addBtn("AIMBOT LOCK",150),
    addBtn("HITBOX",195),
    addBtn("FLY",240),
    addBtn("HIGH JUMP",285),
    addBtn("NOCLIP",330)
}

local states = {false,false,false,false,false,false,false}
local flyConn

Circle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

local function toggle(i,on)
    btns[i].Text = btns[i].Text:gsub(" ❌",""):gsub(" ✅","") .. (on and " ✅" or " ❌")
    btns[i].BackgroundColor3 = on and Color3.fromRGB(140,0,255) or Color3.fromRGB(25,25,25)
end

btns[1].MouseButton1Click:Connect(function() states[1]=not states[1] toggle(1,states[1]) end)
btns[2].MouseButton1Click:Connect(function() states[2]=not states[2] toggle(2,states[2]) end)
btns[3].MouseButton1Click:Connect(function() states[3]=not states[3] toggle(3,states[3]) end)
btns[4].MouseButton1Click:Connect(function() states[4]=not states[4] toggle(4,states[4]) end)
btns[5].MouseButton1Click:Connect(function()
    states[5]=not states[5] toggle(5,states[5])
    if states[5] then flyConn=RunService.RenderStepped:Connect(function() local hrp=Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hrp and hum then hum.PlatformStand=true hrp.CFrame=hrp.CFrame+Camera.CFrame.LookVector*2.5 end end) else if flyConn then flyConn:Disconnect() end local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.PlatformStand=false end end
end)
btns[6].MouseButton1Click:Connect(function() states[6]=not states[6] toggle(6,states[6]) local hum=Player.Character and Player.Character:FindFirstChild("Humanoid") if hum then hum.JumpPower=states[6] and 130 or 50 hum.UseJumpPower=true end end)
btns[7].MouseButton1Click:Connect(function() states[7]=not states[7] toggle(7,states[7]) end)

RunService.RenderStepped:Connect(function()
    local char=Player.Character local hrp=char and char:FindFirstChild("HumanoidRootPart") local hum=char and char:FindFirstChild("Humanoid")
    if states[1] and hrp and hum and hum.MoveDirection.Magnitude>0 then hrp.CFrame=hrp.CFrame+(hum.MoveDirection*0.25) end
    if states[7] and char then for _,v in pairs(char:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide=false end end end
    if states[2] then for _,v in pairs(game.Players:GetPlayers()) do if v~=Player and v.Character and not v.Character:FindFirstChild("E") then local h=Instance.new("Highlight",v.Character) h.Name="E" h.FillColor=Color3.fromRGB(255,0,0) end end else for _,v in pairs(game.Players:GetPlayers()) do if v.Character and v.Character:FindFirstChild("E") then v.Character.E:Destroy() end end end
    if states[4] then for _,v in pairs(game.Players:GetPlayers()) do if v~=Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then v.Character.HumanoidRootPart.Size=Vector3.new(7,7,7) v.Character.HumanoidRootPart.Transparency=0.6 end end end
    if states[3] then local c,d=nil,300 for _,v in pairs(game.Players:GetPlayers()) do if v~=Player and v.Character and v.Character:FindFirstChild("Head") then local p,o=Camera:WorldToViewportPoint(v.Character.Head.Position) if o then local m=(Vector2.new(p.X,p.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude if m<d then d=m c=v end end end end if c then Camera.CFrame=CFrame.new(Camera.CFrame.Position,c.Character.Head.Position) end end
end)

Player.CharacterAdded:Connect(function(c) c:WaitForChild("Humanoid") wait(1) if states[6] then c.Humanoid.JumpPower=130 end end)
