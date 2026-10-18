-- BY DELTERO Y EDER - AIMBOT + SPEED + ESP - V15 ANTI-KICK
local P = game.Players.LocalPlayer
local PG = P:WaitForChild("PlayerGui")
local Players = game.Players
local Cam = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

for _,v in pairs(PG:GetChildren()) do if v.Name=="DelteroHub" then v:Destroy() end end
local Gui = Instance.new("ScreenGui", PG) Gui.Name="DelteroHub" Gui.ResetOnSpawn=false
local Main = Instance.new("Frame", Gui) Main.Size=UDim2.new(0,280,0,380) Main.Position=UDim2.new(0.5,-140,0.5,-190) Main.BackgroundColor3=Color3.fromRGB(15,15,15) Main.Active=true Main.Draggable=true Instance.new("UICorner",Main).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",Main).Color=Color3.fromRGB(140,0,255) Instance.new("UIStroke",Main).Thickness=2

local Title = Instance.new("TextLabel", Main) Title.Size=UDim2.new(1,0,0,45) Title.Text="BY DELTERO Y EDER 👹 V15" Title.TextScaled=true Title.Font=Enum.Font.GothamBlack Title.BackgroundColor3=Color3.fromRGB(0,0,0) Title.TextColor3=Color3.fromRGB(255,0,0) Instance.new("UICorner",Title)

local function btn(txt,y) local b=Instance.new("TextButton",Main) b.Size=UDim2.new(0,260,0,38) b.Position=UDim2.new(0,10,0,y) b.Text=txt.." ❌" b.BackgroundColor3=Color3.fromRGB(35,35,35) b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextScaled=true Instance.new("UICorner",b) return b end

local bAim = btn("🎯 AIMBOT",55)
local bEsp = btn("👁️ ESP",100)
local bHit = btn("📦 HITBOX CHICO (SAFE)",145)
local bSpeed = btn("⚡ SPEED (BYPASS)",190)
local bNoclip = btn("👻 NOCLIP",235)
local bClose = btn("❌ CERRAR",310)

local function toggle(b,s) b.Text=b.Text:gsub(" ❌",""):gsub(" ✅","")..(s and " ✅" or " ❌") b.BackgroundColor3=s and Color3.fromRGB(0,170,0) or Color3.fromRGB(35,35,35) end

-- AIMBOT
local aimOn = false
local fov = 200
bAim.MouseButton1Click:Connect(function() aimOn=not aimOn toggle(bAim,aimOn) end)

RS.RenderStepped:Connect(function()
    if not aimOn then return end
    local closest, dist = nil, fov
    for _,plr in pairs(Players:GetPlayers()) do
        if plr~=P and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character.Humanoid.Health>0 then
            local pos, on = Cam:WorldToViewportPoint(plr.Character.Head.Position)
            if on then
                local mag = (Vector2.new(pos.X,pos.Y)-Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2)).Magnitude
                if mag<dist then closest=plr dist=mag end
            end
        end
    end
    if closest and closest.Character.Head then
        Cam.CFrame = Cam.CFrame:Lerp(CFrame.new(Cam.CFrame.Position, closest.Character.Head.Position), 0.15)
    end
end)

-- ESP
local espOn = false
bEsp.MouseButton1Click:Connect(function()
    espOn=not espOn toggle(bEsp,espOn)
    if espOn then
        task.spawn(function() while espOn do task.wait(2)
            for _,plr in pairs(Players:GetPlayers()) do if plr~=P and plr.Character and not plr.Character:FindFirstChild("DelESP") then local h=Instance.new("Highlight") h.Name="DelESP" h.Adornee=plr.Character h.FillColor=Color3.fromRGB(255,0,0) h.FillTransparency=0.7 h.Parent=plr.Character end end end end)
    else for _,plr in pairs(Players:GetPlayers()) do if plr.Character and plr.Character:FindFirstChild("DelESP") then plr.Character.DelESP:Destroy() end end end
end)

-- HITBOX SAFE 3.5 (NO TE SACA)
local hitOn =
