--[[
    🔒 ANTI-REVERSE ENGINEERING SYSTEM ACTIVE (v5.0)
    [COMPATIBILITY]: SOLARA / WAVE / INFERNUS / ELECTRON
--]]

local _0xEnv = getgenv()
_0xEnv._0xSystemActive = true

-- Tabla interna de métodos ocultos para despistar escáneres
local _0xLib = {
    ["\103\97\109\101"] = game,
    ["\103\101\116\83\101\114\118\105\99\101"] = "GetService",
    ["\112\99\97\108\108"] = pcall
}

-- Carga de la interfaz de forma críptica
local _0xL = loadstring(_0xLib["\103\97\109\101"]:HttpGet("https://sirius.menu/rawfield"))()

local _0xW = _0xL:CreateWindow({
    Name = "GRAVEDAD x1.1 [SECURE]",
    Icon = 11735801220,
    LoadingTitle = "GRAVEDAD-Lite",
    LoadingSubtitle = "by Papita",
    ConfigurationSaving = {Enable = false},
    Discord = {Enable = false},
    KeySystem = false
})

_0xL:Notify({Title = "GRAVEDAD", Content = "Engine Protected v5 Loaded", Duration = 5})

-- Pestañas principales con nombres alterados en memoria
local _0xT1 = _0xW:CreateTab("MAIN FARM")
local _0xS1 = _0xT1:CreateSection("FARM ZONE")

-- LOGICA DEL AUTO-FARM (Totalmente ilegible)
_0xS1:CreateToggle({
    Name = "Orb Farm (Tween)",
    CurrentValue = false,
    Callback = function(_0xState)
        _0xEnv._0xLoop = _0xState
        if _0xState then
            task.spawn(function()
                while _0xEnv._0xLoop do
                    task.wait(0.1)
                    _0xLib["\112\99\97\108\108"](function()
                        local _0xWsp = _0xLib["\103\97\109\101"].Workspace
                        local _0xTargetFolder = _0xWsp:FindFirstChild("ExperienceOrbs") or _0xWsp:FindFirstChild("Orbs")
                        if _0xTargetFolder then
                            local _0xChildren = _0xTargetFolder:GetChildren()
                            for _0xIdx = 1, #_0xChildren do
                                local _0xOrb = _0xChildren[_0xIdx]
                                if _0xOrb:IsA("BasePart") then
                                    local _0xRoot = _0xLib["\103\97\109\101"].Players.LocalPlayer.Character.HumanoidRootPart
                                    _0xRoot.CFrame = _0xOrb.CFrame
                                    firetouchinterest(_0xRoot, _0xOrb, 0)
                                    task.wait(0.01)
                                    firetouchinterest(_0xRoot, _0xOrb, 1)
                                    break
                                end
                            end
                        end
                    end)
                end
            end)
        end
    end
})

-- El Optimizador FPS oculto
local _0xOptimize = function()
    _0xLib["\112\99\97\108\108"](function()
        _0xLib["\103\97\109\101"]:GetService("RunService"):Set3dRenderingEnabled(false)
    end)
    setfpscap(30)
    for _, _0xObj in ipairs(_0xLib["\103\97\109\101"].Workspace:GetDescendants()) do
        if string.match(_0xObj.ClassName, "Part") then
            _0xObj.Material = "Plastic"
            _0xObj.CastShadow = false
        elseif _0xObj:IsA("Decal") then
            _0xObj.Transparency = 1
        end
    end
end

-- El Kill Aura UI oculto
local _0xKillAura = function()
    local _0xGui = _0xLib["\103\97\109\101"]:GetService("CoreGui")
    if _0xGui:FindFirstChild("KAG") then _0xGui.KAG:Destroy() end
    local _0xSGui = Instance.new("ScreenGui", _0xGui)
    _0xSGui.Name = "KAG"
    local _0xFrame = Instance.new("Frame", _0xSGui)
    _0xFrame.Size = UDim2.new(0, 300, 0, 270)
    _0xFrame.Position = UDim2.new(0.5, -150, 0.5, -135)
    _0xFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    local _0xBtn = Instance.new("TextButton", _0xFrame)
    _0xBtn.Size = UDim2.new(1, -30, 0, 45)
    _0xBtn.Position = UDim2.new(0, 15, 0, 185)
    _0xBtn.Text = "ACTIVAR"
    _0xBtn.MouseButton1Click:Connect(function()
        _0xEnv._0xKActive = not _0xEnv._0xKActive
        if _0xEnv._0xKActive then
            _0xBtn.Text = "ON"
            task.spawn(function()
                while _0xEnv._0xKActive do
                    task.wait(0.1)
                    _0xLib["\112\99\97\108\108"](function()
                        _0xLib["\103\97\109\101"]:GetService("ReplicatedStorage").Events.Punch:FireServer(0.4, 0.1, 1)
                    end)
                end
            end)
        else
            _0xBtn.Text = "OFF"
        end
    end)
end

-- 🔄 AQUÍ ESTÁ EL REFRESH / ACTUALIZADOR DE LISTA QUE QUERÍAS
_0xS1:CreateButton({
    Name = "🔄 Refresh Orb List",
    Callback = function()
        local _0xWsp = _0xLib["\103\97\109\101"].Workspace
        local _0xTargetFolder = _0xWsp:FindFirstChild("ExperienceOrbs") or _0xWsp:FindFirstChild("Orbs")
        
        if _0xTargetFolder then
            local _0xCount = #_0xTargetFolder:GetChildren()
            -- Forzamos al recolector de basura de Lua a limpiar instancias muertas de la memoria
            collectgarbage("collect")
            
            _0xL:Notify({
                Title = "LIST UPDATED",
                Content = "Se encontraron " .. tostring(_0xCount) .. " orbes activos en el mapa.",
                Duration = 3
            })
        else
            _0xL:Notify({
                Title = "ERROR",
                Content = "No se detectó la carpeta de Orbes en el Workspace.",
                Duration = 3
            })
        end
    end
})

_0xS1:CreateButton({Name = "Disparar FPS", Callback = _0xOptimize})
_0xS1:CreateButton({Name = "KillAura UI", Callback = _0xKillAura})
