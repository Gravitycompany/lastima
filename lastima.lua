--[[
    📜 SCRIPT ORIGINAL - GRAVEDAD LITE
    [ESTADO]: Desofuscado / Código Limpio
--]]

-- Cargar la librería de interfaz Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Crear la ventana principal
local Window = Rayfield:CreateWindow({
    Name = "GRAVEDAD x1.1",
    Icon = 11735801220,
    LoadingTitle = "GRAVEDAD-Lite",
    LoadingSubtitle = "by Papita",
    ConfigurationSaving = {Enable = false},
    Discord = {Enable = false},
    KeySystem = false
})

Rayfield:Notify({
    Title = "GRAVEDAD",
    Content = "Script cargado correctamente",
    Duration = 5
})

-- Crear pestañas y secciones
local MainTab = Window:CreateTab("MAIN FARM")
local FarmSection = MainTab:CreateSection("FARM ZONE")

-- Lógica del Auto-Farm de Orbes
_G.OrbFarm = false
FarmSection:CreateToggle({
    Name = "Orb Farm (Tween)",
    CurrentValue = false,
    Callback = function(Value)
        _G.OrbFarm = Value
        if Value then
            task.spawn(function()
                while _G.OrbFarm do
                    task.wait(0.1)
                    pcall(function()
                        local Workspace = game.Workspace
                        -- Buscar la carpeta contenedora de orbes (ajusta el nombre si el juego cambia)
                        local OrbsFolder = Workspace:FindFirstChild("ExperienceOrbs") or Workspace:FindFirstChild("Orbs")
                        
                        if OrbsFolder then
                            local Children = OrbsFolder:GetChildren()
                            for i = 1, #Children do
                                local Orb = Children[i]
                                if Orb:IsA("BasePart") then
                                    local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                                    -- Teletransportar e interactuar con el objeto
                                    RootPart.CFrame = Orb.CFrame
                                    firetouchinterest(RootPart, Orb, 0)
                                    task.wait(0.01)
                                    firetouchinterest(RootPart, Orb, 1)
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

-- 🔄 Función de Actualización / Refresh de Lista
FarmSection:CreateButton({
    Name = "🔄 Refresh Orb List",
    Callback = function()
        local Workspace = game.Workspace
        local OrbsFolder = Workspace:FindFirstChild("ExperienceOrbs") or Workspace:FindFirstChild("Orbs")
        
        if OrbsFolder then
            -- Contar cuántos objetos activos existen en este momento
            local TotalOrbs = #OrbsFolder:GetChildren()
            
            -- Limpieza de instancias huérfanas en la memoria de Lua
            collectgarbage("collect")
            
            Rayfield:Notify({
                Title = "LISTA ACTUALIZADA",
                Content = "Se encontraron " .. tostring(TotalOrbs) .. " orbes activos en el mapa.",
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "ERROR",
                Content = "No se encontró la carpeta de Orbes en el Workspace.",
                Duration = 3
            })
        end
    end
})

-- Función para optimizar rendimiento (Bajar gráficos / Desactivar 3D)
local function OptimizeFPS()
    pcall(function()
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end)
    setfpscap(30)
    for _, obj in ipairs(game.Workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Material = Enum.Material.Plastic
            obj.CastShadow = false
        elseif obj:IsA("Decal") then
            obj.Transparency = 1
        end
    end
end

-- Función para generar la interfaz alternativa de Kill Aura
local function CreateKillAuraUI()
    local CoreGui = game:GetService("CoreGui")
    if CoreGui:FindFirstChild("KAG") then 
        CoreGui.KAG:Destroy() 
    end
    
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "KAG"
    
    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 270)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -135)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(1, -30, 0, 45)
    Button.Position = UDim2.new(0, 15, 0, 185)
    Button.Text = "ACTIVAR"
    
    _G.KillAuraActive = false
    Button.MouseButton1Click:Connect(function()
        _G.KillAuraActive = not _G.KillAuraActive
        if _G.KillAuraActive then
            Button.Text = "ON"
            task.spawn(function()
                while _G.KillAuraActive do
                    task.wait(0.1)
                    pcall(function()
                        game:GetService("ReplicatedStorage").Events.Punch:FireServer(0.4, 0.1, 1)
                    end)
                end
            end)
        else
            Button.Text = "OFF"
        end
    end)
end

-- Botones adicionales de utilidad
FarmSection:CreateButton({Name = "Disparar FPS", Callback = OptimizeFPS})
FarmSection:CreateButton({Name = "KillAura UI", Callback = CreateKillAuraUI})
