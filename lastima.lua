--[[
    PROTECTED BY GRAVEDAD ANTI-LEAK ENGINE
    [🔒] STATUS: ENCRYPTED / OBFUSCATED
--]]

local _0xLocalG = getgenv()
_0xLocalG.debugX = false

local _0xBaseUrls = {
    ["Rayfield"] = "https://sirius.menu/rayfield",
    ["Punch"] = "\x45\x76\x65\x6e\x74\x73", -- "Events" en Hex
    ["Upgrade"] = "\x55\x70\x67\x72\x61\x64\x65\x41\x62\x69\x6c\x69\x74\x79" -- "UpgradeAbility" en Hex
}

local Rayfield = loadstring(game:HttpGet(_0xBaseUrls.Rayfield))()

local Window = Rayfield:CreateWindow({
   Name = "GRAVEDADx1.1 [SECURE]",
   Icon = 11735801220,
   LoadingTitle = "GRAVEDAD-Lite",
   LoadingSubtitle = "by Papita",
   Theme = "Ocean",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = { Enabled = false, FolderName = nil, FileName = "Big Hub" },
   Discord = { Enabled = false, Invite = "noinvitelink", RememberJoins = true },
   KeySystem = false
})

Rayfield:Notify({
    Title = "Bienvenido ha age of Mierda",
    Content = "Worst Game - Secure Version",
    Duration = 8,
    Image = 4483362458
})

local MainTab = Window:CreateTab("MAIN FARM")
local MainSection = MainTab:CreateSection("MAIN FARM HERE")

-- ==========================================
-- [PROTECTED] ORB FARM METODO TWEEN
-- ==========================================
MainTab:CreateToggle({
    Name = "Orb Farm (Tween Mode)",
    CurrentValue = false,
    Flag = "OrbTweenFarm",
    Callback = function(_0xState)
        _0xLocalG.OrbFarm = _0xState
        if _0xLocalG.OrbFarm then
            task.spawn(function()
                local _0xP = game:GetService("\x50\x6c\x61\x79\x65\x72\x73")
                local _0xTS = game:GetService("\x54\x77\x65\x65\x6e\x53\x65\x72\x76\x69\x63\x65")
                local _0xLP = _0xP.LocalPlayer
                
                local _0xFolder = workspace:FindFirstChild("ExperienceOrbs") or workspace:FindFirstChild("Orbs") or workspace:FindFirstChild("AllOrbs")
                if not _0xFolder then
                    for _, o in ipairs(workspace:GetChildren()) do
                        if o.Name:lower():find("orb") or o.Name:lower():find("experience") then
                            _0xFolder = o break
                        end
                    end
                end

                while _0xLocalG.OrbFarm do
                    task.wait(0.1)
                    pcall(function()
                        local _0xChar = _0xLP.Character
                        local _0xRoot = _0xChar and _0xChar:FindFirstChild("\x48\x75\x6d\x61\x6e\x6f\x69\x64\x52\x6f\x6f\x74\x50\x61\x72\x74")
                        if not _0xRoot then return end

                        if _0xFolder then
                            local _0xList = _0xFolder:GetChildren()
                            for i = 1, #_0xList do
                                if not _0xLocalG.OrbFarm then break end
                                local _0xOrb = _0xList[i]
                                if _0xOrb:IsA("BasePart") then
                                    local _0xDist = (_0xOrb.Position - _0xRoot.Position).Magnitude
                                    if _0xDist < 1500 then
                                        local _0xTime = _0xDist / 150
                                        local _0xTI = TweenInfo.new(_0xTime, Enum.EasingStyle.Linear)
                                        local _0xTwn = _0xTS:Create(_0xRoot, _0xTI, {CFrame = _0xOrb.CFrame})
                                        _0xTwn:Play()
                                        _0xTwn.Completed:Wait()
                                        firetouchinterest(_0xRoot, _0xOrb, 0)
                                        task.wait(0.02)
                                        firetouchinterest(_0xRoot, _0xOrb, 1)
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

-- ==========================================
-- [PROTECTED] DISPARA TUS FPS (ULTRA ENGINE)
-- ==========================================
MainTab:CreateButton({
    Name = " Dispara tus FPS ",
    Callback = function()
        pcall(function()
            -- Forzar apagado del motor 3D en segundo plano para congelar consumo GPU a 0%
            game:GetService("RunService"):Set3DRenderingEnabled(false)
        end)
        
        setfpscap(30)
        
        local _0xW = workspace
        local _0xL = game:GetService("\x4c\x69\x67\x68\x74\x69\x6e\x67")
        local _0xT = _0xW:FindFirstChildOfClass("Terrain")

        if _0xT then
            _0xT.WaterWaveSize = 0 _0xT.WaterWaveSpeed = 0
            _0xT.WaterReflectance = 0 _0xT.WaterTransparency = 0
            _0xT:Clear()
        end

        _0xL.GlobalShadows = false
        _0xL.FogEnd = 9e9
        _0xL.Brightness = 0
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        task.spawn(function()
            local _0xDesc = _0xW:GetDescendants()
            for i = 1, #_0xDesc do
                local v = _0xDesc[i]
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.Plastic
                    v.Reflectance = 0
                    v.CastShadow = false
                elseif v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Lifetime = NumberRange.new(0)
                elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v.Enabled = false
                end
                if i % 500 == 0 then task.wait() end
            end
        end)

        for _, e in ipairs(_0xL:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("BloomEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("DepthOfFieldEffect") then
                e.Enabled = false
            end
        end

        _0xW.DescendantAdded:Connect(function(v)
            if v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("ForceField") then
                v:Destroy()
            end
        end)

        Rayfield:Notify({
            Title = "FPS Boost",
            Content = "Modo Gráficos Desactivados Activo.",
            Duration = 5
        })
    end,
})

-- ==========================================
-- [PROTECTED] KILL AURA ENGINE
-- ==========================================
MainTab:CreateButton({
    Name = "KillAura UI MENU lite",
    Callback = function()
        task.spawn(function()
            local _0xCG = game:GetService("CoreGui")
            if _0xCG:FindFirstChild("KillAuraGui") then _0xCG.KillAuraGui:Destroy() end

            local _0xP = game:GetService("Players")
            local _0xRS = game:GetService("ReplicatedStorage")
            local _0xUIS = game:GetService("UserInputService")
            
            local sGui = Instance.new("ScreenGui", _0xCG)
            sGui.Name = "KillAuraGui"
            sGui.ResetOnSpawn = false

            local main = Instance.new("Frame", sGui)
            main.Size = UDim2.new(0, 300, 0, 270)
            main.Position = UDim2.new(0.5, -150, 0.5, -135)
            main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            main.BorderSizePixel = 0
            Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
            
            local mStroke = Instance.new("UIStroke", main)
            mStroke.Color = Color3.fromRGB(60, 60, 70)

            local title = Instance.new("TextLabel", main)
            title.Size = UDim2.new(1, -40, 0, 40)
            title.Position = UDim2.new(0, 15, 0, 0)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = "⚔️ KILL AURA SECURE"
            title.TextColor3 = Color3.fromRGB(240, 240, 245)
            title.TextSize = 13

            local closeBtn = Instance.new("TextButton", main)
            closeBtn.Size = UDim2.new(0, 30, 0, 30)
            closeBtn.Position = UDim2.new(1, -35, 0, 5)
            closeBtn.BackgroundTransparency = 1
            closeBtn.Text = "❌"
            closeBtn.MouseButton1Click:Connect(function() _0xLocalG.attackPlayer = false sGui:Destroy() end)

            local function cInput(ph, txt, posY)
                local box = Instance.new("TextBox", main)
                box.Size = UDim2.new(1, -30, 0, 36)
                box.Position = UDim2.new(0, 15, 0, posY)
                box.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
                box.Text = txt
                box.PlaceholderText = ph
                box.TextColor3 = Color3.fromRGB(220, 220, 230)
                box.ClearTextOnFocus = false
                Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
                return box
            end

            local hBox = cInput("Golpes (Ej: 5)", "Golpes: " .. (_0xLocalG.hits or 1), 45)
            local cdBox = cInput("Cooldown (Ej: 0.1)", "Cooldown: " .. (_0xLocalG.cooldown or 1), 90)

            hBox.FocusLost:Connect(function()
                local val = tonumber(hBox.Text:match("%d+")) or _0xLocalG.hits or 1
                _0xLocalG.hits = val hBox.Text = "Golpes: " .. val
            end)

            cdBox.FocusLost:Connect(function()
                local val = tonumber(cdBox.Text:match("[%d%.]+")) or _0xLocalG.cooldown or 1
                if val < 0.01 then val = 0.01 end
                _0xLocalG.cooldown = val cdBox.Text = string.format("Cooldown: %.2fs", val)
            end)

            local sLabel = Instance.new("TextLabel", main)
            sLabel.Size = UDim2.new(1, -30, 0, 30)
            sLabel.Position = UDim2.new(0, 15, 0, 140)
            sLabel.BackgroundTransparency = 1
            sLabel.Text = "● ESTADO: INACTIVO"
            sLabel.TextColor3 = Color3.fromRGB(220, 80, 80)

            local tBtn = Instance.new("TextButton", main)
            tBtn.Size = UDim2.new(1, -30, 0, 45)
            tBtn.Position = UDim2.new(0, 15, 0, 185)
            tBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 65)
            tBtn.Text = "ACTIVAR"
            Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 6)

            tBtn.MouseButton1Click:Connect(function()
                _0xLocalG.attackPlayer = not _0xLocalG.attackPlayer
                if _0xLocalG.attackPlayer then
                    tBtn.Text = "DESACTIVAR"
                    tBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 80)
                    sLabel.Text = "● ACTIVO"
                    sLabel.TextColor3 = Color3.fromRGB(100, 220, 140)

                    task.spawn(function()
                        -- Llamada protegida por cadena hexadecimal a la carpeta de eventos
                        local pEvent = _0xRS:WaitForChild(_0xBaseUrls.Punch):WaitForChild("Punch")
                        while _0xLocalG.attackPlayer do
                            local c = _0xP.LocalPlayer.Character
                            if c and c:FindFirstChild("Humanoid") and c.Humanoid.Health > 0 then
                                for i = 1, (_0xLocalG.hits or 1) do
                                    if not _0xLocalG.attackPlayer then break end
                                    pEvent:FireServer(0.4, 0.1, 1)
                                end
                            end
                            task.wait(_0xLocalG.cooldown or 1)
                        end
                    end)
                else
                    tBtn.Text = "ACTIVAR"
                    tBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 65)
                    sLabel.Text = "● ESTADO: INACTIVO"
                    sLabel.TextColor3 = Color3.fromRGB(220, 80, 80)
                end
            end)
        end)
    end,
})

-- ==========================================
-- [PROTECTED] SPAWN POINT UI
-- ==========================================
MainTab:CreateButton({
    Name = "Spawn Point UI v2.1 lite",
    Callback = function()
        local _0xP = game:GetService("Players")
        local _0xUIS = game:GetService("UserInputService")
        local player = _0xP.LocalPlayer
        local spawnPosition = nil
        local isActive = false
        local interval = 1.00

        local sGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        sGui.Name = "QuantumSpawnUI"
        sGui.ResetOnSpawn = false

        local main = Instance.new("Frame", sGui)
        main.Size = UDim2.new(0, 300, 0, 240)
        main.Position = UDim2.new(0.5, -150, 0.5, -120)
        main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)

        local coordText = Instance.new("TextLabel", main)
        coordText.Size = UDim2.new(1, -30, 0, 40)
        coordText.Position = UDim2.new(0, 15, 0, 45)
        coordText.Text = "POS: NOT SET"

        local intervalInput = Instance.new("TextBox", main)
        intervalInput.Size = UDim2.new(1, -30, 0, 35)
        intervalInput.Position = UDim2.new(0, 15, 0, 95)
        intervalInput.Text = "Intervalo: 1.00s"

        local setBtn = Instance.new("TextButton", main)
        setBtn.Size = UDim2.new(0.43, 0, 0, 40)
        setBtn.Position = UDim2.new(0, 15, 0, 145)
        setBtn.Text = "SET POS"

        local activateBtn = Instance.new("TextButton", main)
        activateBtn.Size = UDim2.new(0.43, 0, 0, 40)
        activateBtn.Position = UDim2.new(0.57, -15, 0, 145)
        activateBtn.Text = "ACTIVATE"

        intervalInput.FocusLost:Connect(function()
            local value = tonumber(intervalInput.Text:match("[%d%.]+"))
            if value and value >= 0.01 and value <= 5.0 then interval = value end
            intervalInput.Text = string.format("Intervalo: %.2fs", interval)
        end)

        setBtn.MouseButton1Click:Connect(function()
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                spawnPosition = hrp.CFrame
                coordText.Text = string.format("X: %.1f | Y: %.1f | Z: %.1f", hrp.Position.X, hrp.Position.Y, hrp.Position.Z)
            end
        end)

        activateBtn.MouseButton1Click:Connect(function()
            if not spawnPosition then return end
            isActive = not isActive
            if isActive then
                activateBtn.Text = "DEACTIVATE"
                task.spawn(function()
                    while isActive do
                        task.wait(interval)
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if isActive and spawnPosition and hrp then hrp.CFrame = spawnPosition end
                    end
                end)
            else
                activateBtn.Text = "ACTIVATE"
            end
        end)
    end,
})

-- ==========================================
-- [PROTECTED] ANTI-AFK ENGINE
-- ==========================================
local AntiAFK_Enabled = false
MainTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        AntiAFK_Enabled = not AntiAFK_Enabled
        if AntiAFK_Enabled then
            local p = game:GetService("Players").LocalPlayer
            local function enableAntiAFK()
                p.Idled:Connect(function()
                    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            end
            enableAntiAFK()
            p.CharacterAdded:Connect(enableAntiAFK)
            Rayfield:Notify({ Title = "Anti-AFK", Content = "Activado.", Duration = 4 })
        end
    end,
})

-- ==========================================
-- TELEPORT SYSTEM
-- ==========================================
local PlayersSection = MainTab:CreateSection("PLAYER TELEPORT")
local PlayersService = game:GetService("Players")
local lpClient = PlayersService.LocalPlayer
local pList = {}
local targetPlayer = nil

local function refreshPList()
    table.clear(pList)
    for _, p in ipairs(PlayersService:GetPlayers()) do
        if p ~= lpClient and p.Name then table.insert(pList, p.Name) end
    end
end
refreshPList()

local PlayerDropdown = MainTab:CreateDropdown({
    Name = "Seleccionar Jugador",
    Options = pList,
    CurrentOption = "",
    MultipleOptions = false,
    Flag = "PlayerTPDropdown",
    Callback = function(sel)
        if type(sel) == "table" then targetPlayer = sel[1] else targetPlayer = sel end
    end,
})

MainTab:CreateButton({
    Name = "Teletransportarse",
    Callback = function()
        if not targetPlayer then return end
        local t = PlayersService:FindFirstChild(targetPlayer)
        local tHrp = t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")
        local myHrp = lpClient.Character and lpClient.Character:FindFirstChild("HumanoidRootPart")
        if myHrp and tHrp then myHrp.CFrame = tHrp.CFrame * CFrame.new(0, 3, 0) end
    end,
})

-- ==========================================
-- [PROTECTED] AUTO STATS ENGINE
-- ==========================================
local StatsTab = Window:CreateTab("Auto Stats", 6031075938)
StatsTab:CreateSection("Upgrade Settings")

_0xLocalG.selectedstat = "vitality" 

StatsTab:CreateDropdown({
    Name = "Select Stat",
    Options = {"vitality", "healing", "strength", "energy", "flight", "speed", "climbing", "swinging", "fireball", "frost", "lightning", "power", "telekinesis", "shield", "laserVision", "metalSkin"},
    CurrentOption = {"vitality"},
    MultipleOptions = false,
    Callback = function(opt)
        if type(opt) == "table" then _0xLocalG.selectedstat = opt[1] else _0xLocalG.selectedstat = opt end
    end,
})

local amounts = {10, 50, 100, 500, 1000, 5000, 10000, 40000, 100000}
for _, amt in ipairs(amounts) do
    StatsTab:CreateButton({
        Name = "Upgrade " .. amt .. "x",
        Callback = function()
            if _0xLocalG.selectedstat then
                for i = 1, amt do
                    task.spawn(function()
                        -- Invocación codificada
                        game:GetService("ReplicatedStorage")[_0xBaseUrls.Punch][_0xBaseUrls.Upgrade]:InvokeServer(_0xLocalG.selectedstat)
                    end)
                end
            end
        end,
    })
end
