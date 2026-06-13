debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "GRAVEDADx1.1",
   Icon = 11735801220, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "GRAVEDAD-Lite",
   LoadingSubtitle = "by Papita",
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sistema avanzado prueba",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"oi"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
    Title = "Bienvenido ha age of Mierda",
    Content = "Worst Game",
    Duration = 12,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
                print("The user tapped Okay!")
            end
        },
    },
})

-- MAIN FARM TAB (FIX)
local MainTab = Window:CreateTab("MAIN FARM")
local MainSection = MainTab:CreateSection("MAIN FARM HERE")

-- ORB FARM (ACTUALIZADO & ULTRA RÁPIDO)
MainTab:CreateToggle({
    Name = "Orb Farm",
    CurrentValue = false,
    Flag = "OrbFarm",
    Callback = function(v)
        getgenv().OrbFarm = v
        
        if getgenv().OrbFarm then
            task.spawn(function()
                -- Cacheamos servicios fuera del bucle para máxima velocidad
                local Players = game:GetService("Players")
                local lp = Players.LocalPlayer
                local orbsFolder = workspace:FindFirstChild("ExperienceOrbs")

                while getgenv().OrbFarm do
                    -- Espera óptima (0.1s para no congelar el juego pero farmear instantáneo)
                    task.wait(0.1) 
                    
                    pcall(function()
                        local char = lp.Character
                        -- Usamos el HumanoidRootPart o Head de forma segura
                        local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head"))
                        if not root then return end

                        -- Si la carpeta cambió de nombre o es dinámica, intentamos buscarla
                        if not orbsFolder then
                            orbsFolder = workspace:FindFirstChild("ExperienceOrbs") or workspace:FindFirstChild("Orbs")
                        end

                        if orbsFolder then
                            -- Conseguimos los hijos directos (más rápido que GetDescendants)
                            local orbs = orbsFolder:GetChildren()
                            for i = 1, #orbs do
                                if not getgenv().OrbFarm then break end
                                local orb = orbs[i]
                                
                                -- Método 1: Fuerza Bruta con firetouchinterest
                                local touchInterest = orb:FindFirstChildWhichIsA("TouchInterest", true)
                                if touchInterest then
                                    firetouchinterest(root, orb, 0)
                                    task.defer(firetouchinterest, root, orb, 1) -- Desconexión limpia
                                
                                -- Método 2: Bypass por Magnitud (Si el juego eliminó los TouchInterests en cliente)
                                elseif orb:IsA("BasePart") then
                                    -- Simulamos que estamos tocando la orb mediante Redirección de CFrame 
                                    -- (Muchas protecciones actuales caen con esto)
                                    if (orb.Position - root.Position).Magnitude < 500 then -- Radio de 500 pernos
                                        firetouchinterest(root, orb, 0)
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

local Button = MainTab:CreateButton({
    Name = "KillAura UI MENU lite",
    Callback = function()
        task.spawn(function()
            -- Limpieza previa
            local coreGui = game:GetService("CoreGui")
            if coreGui:FindFirstChild("KillAuraGui") then 
                coreGui.KillAuraGui:Destroy()
            end

            -- Servicios
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local UIS = game:GetService("UserInputService")
            
            -- UI Base Minimalista
            local screenGui = Instance.new("ScreenGui", coreGui)
            screenGui.Name = "KillAuraGui"
            screenGui.ResetOnSpawn = false

            -- Frame Principal (Diseño plano, moderno y compacto)
            local main = Instance.new("Frame", screenGui)
            main.Size = UDim2.new(0, 300, 0, 270)
            main.Position = UDim2.new(0.5, -150, 0.5, -135)
            main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
            main.BorderSizePixel = 0

            Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
            local mainStroke = Instance.new("UIStroke", main)
            mainStroke.Color = Color3.fromRGB(60, 60, 70)
            mainStroke.Thickness = 1.5

            -- Título Principal
            local title = Instance.new("TextLabel", main)
            title.Size = UDim2.new(1, -40, 0, 40)
            title.Position = UDim2.new(0, 15, 0, 0)
            title.BackgroundTransparency = 1
            title.Font = Enum.Font.GothamBold
            title.Text = "⚔️ KILL AURA v2"
            title.TextColor3 = Color3.fromRGB(240, 240, 245)
            title.TextSize = 13
            title.TextXAlignment = Enum.TextXAlignment.Left

            -- Botón Cerrar Discreto
            local closeBtn = Instance.new("TextButton", main)
            closeBtn.Size = UDim2.new(0, 30, 0, 30)
            closeBtn.Position = UDim2.new(1, -35, 0, 5)
            closeBtn.BackgroundTransparency = 1
            closeBtn.Font = Enum.Font.Gotham
            closeBtn.Text = "❌"
            closeBtn.TextColor3 = Color3.fromRGB(140, 140, 150)
            closeBtn.TextSize = 14

            closeBtn.MouseButton1Click:Connect(function()
                getgenv().attackPlayer = false
                screenGui:Destroy()
            end)

            -- Función constructora para Inputs (Ahorra líneas de código)
            local function createInput(placeholder, text, posY)
                local box = Instance.new("TextBox", main)
                box.Size = UDim2.new(1, -30, 0, 36)
                box.Position = UDim2.new(0, 15, 0, posY)
                box.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
                box.Font = Enum.Font.Gotham
                box.Text = text
                box.PlaceholderText = placeholder
                box.TextColor3 = Color3.fromRGB(220, 220, 230)
                box.TextSize = 12
                box.ClearTextOnFocus = false
                Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
                return box
            end

            local hitsBox = createInput("Cantidad de golpes (Ej: 5)", "Golpes: " .. (getgenv().hits or 1), 45)
            local cooldownBox = createInput("Cooldown en segundos (Ej: 0.1)", "Cooldown: " .. (getgenv().cooldown or 1), 90)

            -- Formateadores de texto e inputs al perder foco
            hitsBox.FocusLost:Connect(function()
                local val = tonumber(hitsBox.Text:match("%d+")) or getgenv().hits or 1
                getgenv().hits = val
                hitsBox.Text = "Golpes: " .. val
            end)

            cooldownBox.FocusLost:Connect(function()
                local val = tonumber(cooldownBox.Text:match("[%d%.]+")) or getgenv().cooldown or 1
                if val < 0.01 then val = 0.01 end -- Permite velocidades extremas de hasta 0.01
                getgenv().cooldown = val
                cooldownBox.Text = string.format("Cooldown: %.2fs", val)
            end)

            -- Estado Visual
            local statusLabel = Instance.new("TextLabel", main)
            statusLabel.Size = UDim2.new(1, -30, 0, 30)
            statusLabel.Position = UDim2.new(0, 15, 0, 140)
            statusLabel.BackgroundTransparency = 1
            statusLabel.Font = Enum.Font.Code
            statusLabel.Text = "● ESTADO: INACTIVO"
            statusLabel.TextColor3 = Color3.fromRGB(220, 80, 80)
            statusLabel.TextSize = 11
            statusLabel.TextXAlignment = Enum.TextXAlignment.Left

            -- Botón de Activación Principal
            local toggleBtn = Instance.new("TextButton", main)
            toggleBtn.Size = UDim2.new(1, -30, 0, 45)
            toggleBtn.Position = UDim2.new(0, 15, 0, 185)
            toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 65)
            toggleBtn.Font = Enum.Font.GothamBold
            toggleBtn.Text = "ACTIVAR"
            toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleBtn.TextSize = 13
            toggleBtn.AutoButtonColor = true
            Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

            -- Lógica Eficaz del KillAura
            toggleBtn.MouseButton1Click:Connect(function()
                getgenv().attackPlayer = not getgenv().attackPlayer
                
                -- Actualizar valores de los inputs inmediatamente antes de arrancar
                getgenv().hits = tonumber(hitsBox.Text:match("%d+")) or getgenv().hits or 1
                local cd = tonumber(cooldownBox.Text:match("[%d%.]+")) or getgenv().cooldown or 1
                getgenv().cooldown = cd < 0.01 and 0.01 or cd

                if getgenv().attackPlayer then
                    toggleBtn.Text = "DESACTIVAR"
                    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 80)
                    mainStroke.Color = Color3.fromRGB(40, 140, 80)
                    statusLabel.Text = string.format("● ACTIVO | HITS: %d | CD: %.2fs", getgenv().hits, getgenv().cooldown)
                    statusLabel.TextColor3 = Color3.fromRGB(100, 220, 140)

                    -- Bucle optimizado en un hilo separado
                    task.spawn(function()
                        local punchEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Punch")
                        while getgenv().attackPlayer do
                            local char = Players.LocalPlayer.Character
                            if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                                -- Bucle de golpes optimizado sin pausas internas innecesarias
                                for i = 1, getgenv().hits do
                                    if not getgenv().attackPlayer then break end
                                    punchEvent:FireServer(0.4, 0.1, 1)
                                end
                            end
                            task.wait(getgenv().cooldown)
                        end
                    end)
                else
                    toggleBtn.Text = "ACTIVAR"
                    toggleBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 65)
                    mainStroke.Color = Color3.fromRGB(60, 60, 70)
                    statusLabel.Text = "● ESTADO: INACTIVO"
                    statusLabel.TextColor3 = Color3.fromRGB(220, 80, 80)
                end
            end)

            -- Sistema de Arrastre (Drag) Ultra Optimizado (Sustituye la propiedad obsoleta .Draggable)
            local dragging, dragInput, dragStart, startPos
            main.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true dragStart = input.Position startPos = main.Position
                    input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
                end
            end)
            main.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
            UIS.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    local delta = input.Position - dragStart
                    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                end
            end)
        end)
    end,
})

MainTab:CreateButton({
    Name = "Spawn Point UI v2.1 lite",
    Callback = function()
        -- SISTEMA SPAWN BY PAPAS (MINIMALISTA - SOPORTE 0.01s)
        local Players = game:GetService("Players")
        local TweenService = game:GetService("TweenService")
        local UIS = game:GetService("UserInputService")
        
        local player = Players.LocalPlayer
        local spawnPosition = nil
        local isActive = false
        local interval = 1.00 -- Por defecto

        -- UI Base
        local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        screenGui.Name = "QuantumSpawnUI"
        screenGui.ResetOnSpawn = false

        -- Ventana Principal
        local main = Instance.new("Frame", screenGui)
        main.Size = UDim2.new(0, 300, 0, 240)
        main.Position = UDim2.new(0.5, -150, 0.5, -120)
        main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        main.BorderSizePixel = 0

        Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
        local mainStroke = Instance.new("UIStroke", main)
        mainStroke.Color = Color3.fromRGB(50, 50, 60)

        -- Título
        local title = Instance.new("TextLabel", main)
        title.Size = UDim2.new(1, -40, 0, 40)
        title.Position = UDim2.new(0, 15, 0, 0)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.Text = "GRAVEDAD=AZUL v2"
        title.TextColor3 = Color3.fromRGB(235, 235, 240)
        title.TextSize = 14
        title.TextXAlignment = Enum.TextXAlignment.Left

        -- Botón Cerrar
        local closeBtn = Instance.new("TextButton", main)
        closeBtn.Size = UDim2.new(0, 30, 0, 30)
        closeBtn.Position = UDim2.new(1, -35, 0, 5)
        closeBtn.BackgroundTransparency = 1
        closeBtn.Font = Enum.Font.Gotham
        closeBtn.Text = "❌"
        closeBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
        closeBtn.TextSize = 14

        -- Indicador de Coordenadas
        local coordText = Instance.new("TextLabel", main)
        coordText.Size = UDim2.new(1, -30, 0, 40)
        coordText.Position = UDim2.new(0, 15, 0, 45)
        coordText.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        coordText.Font = Enum.Font.Code
        coordText.Text = "POS: NOT SET"
        coordText.TextColor3 = Color3.fromRGB(140, 140, 150)
        coordText.TextSize = 12
        Instance.new("UICorner", coordText).CornerRadius = UDim.new(0, 6)

        -- Input de Intervalo (Ajustado para 2 decimales)
        local intervalInput = Instance.new("TextBox", main)
        intervalInput.Size = UDim2.new(1, -30, 0, 35)
        intervalInput.Position = UDim2.new(0, 15, 0, 95)
        intervalInput.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
        intervalInput.Font = Enum.Font.Gotham
        intervalInput.Text = "Intervalo: 1.00s"
        intervalInput.TextColor3 = Color3.fromRGB(200, 200, 210)
        intervalInput.TextSize = 12
        Instance.new("UICorner", intervalInput).CornerRadius = UDim.new(0, 6)

        -- Botones de Acción
        local function createBtn(text, pos, bg)
            local btn = Instance.new("TextButton", main)
            btn.Size = UDim2.new(0.43, 0, 0, 40)
            btn.Position = pos
            btn.BackgroundColor3 = bg
            btn.Font = Enum.Font.GothamBold
            btn.Text = text
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 12
            btn.AutoButtonColor = true
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
            return btn
        end

        local setBtn = createBtn("SET POS", UDim2.new(0, 15, 0, 145), Color3.fromRGB(45, 75, 180))
        local activateBtn = createBtn("ACTIVATE", UDim2.new(0.57, -15, 0, 145), Color3.fromRGB(35, 140, 85))

        -- Lógica: Cambiar Intervalo (Detecta desde 0.01)
        intervalInput.FocusLost:Connect(function()
            local value = tonumber(intervalInput.Text:match("[%d%.]+"))
            -- Ahora el mínimo es 0.01
            if value and value >= 0.01 and value <= 5.0 then 
                interval = value 
            end
            -- Muestra siempre 2 decimales (.2f)
            intervalInput.Text = string.format("Intervalo: %.2fs", interval)
        end)

        -- Lógica: Guardar Posición
        setBtn.MouseButton1Click:Connect(function()
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                spawnPosition = hrp.CFrame
                coordText.Text = string.format("X: %.1f | Y: %.1f | Z: %.1f", hrp.Position.X, hrp.Position.Y, hrp.Position.Z)
                coordText.TextColor3 = Color3.fromRGB(100, 220, 140)
            end
        end)

        -- Lógica: Bucle de Teleport
        activateBtn.MouseButton1Click:Connect(function()
            if not spawnPosition then return end
            isActive = not isActive
            
            if isActive then
                activateBtn.Text = "DEACTIVATE"
                activateBtn.BackgroundColor3 = Color3.fromRGB(170, 45, 45)
                mainStroke.Color = Color3.fromRGB(170, 45, 45)
                
                task.spawn(function()
                    while isActive do
                        task.wait(interval)
                        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                        if isActive and spawnPosition and hrp then
                            hrp.CFrame = spawnPosition
                        end
                    end
                end)
            else
                activateBtn.Text = "ACTIVATE"
                activateBtn.BackgroundColor3 = Color3.fromRGB(35, 140, 85)
                mainStroke.Color = Color3.fromRGB(50, 50, 60)
            end
        end)

        -- Cerrar
        closeBtn.MouseButton1Click:Connect(function()
            isActive = false
            screenGui:Destroy()
        end)

        -- Sistema de Arrastre (Drag)
        local dragging, dragInput, dragStart, startPos
        main.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true dragStart = input.Position startPos = main.Position
                input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
            end
        end)
        main.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end,
})

local AntiAFK_Enabled = false
MainTab:CreateButton({
    Name = "Anti-AFK ",
    Callback = function()
        AntiAFK_Enabled = not AntiAFK_Enabled

        if AntiAFK_Enabled then
            local player = game:GetService("Players").LocalPlayer

            local function enableAntiAFK()
                player.Idled:Connect(function()
                    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                end)
            end

            enableAntiAFK()
            player.CharacterAdded:Connect(enableAntiAFK)

            Rayfield:Notify({
                Title = "Anti-AFK",
                Content = "Activado correctamente.",
                Duration = 99999999999
            })
        else
            Rayfield:Notify({
                Title = "Anti-AFK",
                Content = "Desactivado.",
                Duration = 6
            })
        end
    end,
})



MainTab:CreateButton({
    Name = "farm24",
    Callback = function()
        local g = game
        local w = workspace
        local l = g:GetService("Lighting")

        -- 1. Forzar renderizado plano nativo en el Workspace
        w.LevelOfDetail = Enum.LevelOfDetail.Low
        
        local t = w:FindFirstChildOfClass("Terrain")
        if t then
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            t.Decoration = false
        end

        -- 2. Apagar iluminación pesada sin romper el script
        l.GlobalShadows = false
        l.FogEnd = 9e9
        l.Brightness = 0
        
        -- Desactivar efectos ambientales reales de forma directa
        for _, effect in ipairs(l:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("BloomEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("DepthOfFieldEffect") then
                effect:Destroy()
            end
        end

        -- 3. Limpieza y Purga Instantánea (Tablas de alto rendimiento)
        task.spawn(function()
            local descendants = w:GetDescendants()
            
            for i = 1, #descendants do
                local v = descendants[i]
                
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false
                    if v:IsA("MeshPart") then
                        v.RenderFidelity = Enum.RenderFidelity.Performance
                    end
                    
                elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("Beam") or v:IsA("ShirtGraphic") then
                    v:Destroy() 
                    
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                    v:Destroy()
                end
                
                -- Limpieza fluida: cede el paso rápido para evitar lag-spikes
                if i % 1000 == 0 then task.wait() end
            end
        end)

        -- 4. Filtro Anti-Basura Nuevo (Bypass en tiempo de ejecución)
        w.DescendantAdded:Connect(function(v)
            if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
                task.defer(v.Destroy, v)
            elseif v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
            end
        end)

        -- Notificación corregida
        Rayfield:Notify({
            Title = "age of mierda",
            Content = esto elimina cualquier cosa para que tu tostadora dure farmeando,
            Duration = 10
        })
    end,
})

-- Sección de Teletransporte a Jugadores
local PlayersSection = MainTab:CreateSection("PLAYER TELEPORT")

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local playerList = {}
local selectedPlayer = nil

-- Función para actualizar la lista de jugadores de forma segura
local function updatePlayerList()
    table.clear(playerList)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Name then
            table.insert(playerList, p.Name)
        end
    end
end

-- Inicializamos la lista por primera vez
updatePlayerList()

-- Dropdown de Jugadores
local PlayerDropdown = MainTab:CreateDropdown({
    Name = "Seleccionar Jugador",
    Options = playerList,
    CurrentOption = "",
    MultipleOptions = false,
    Flag = "PlayerTPDropdown",
    Callback = function(selected)
        -- Si viene como tabla (dependiendo de la versión de Rayfield), agarramos el primer valor
        if type(selected) == "table" then
            selectedPlayer = selected[1]
        else
            selectedPlayer = selected
        end
    end,
})

-- Botón para Teletransportarse
MainTab:CreateButton({
    Name = " Teletransportarse",
    Callback = function()
        if not selectedPlayer then
            Rayfield:Notify({Title = " Error", Content = "Selecciona un jugador primero", Duration = 3})
            return
        end
        
        local target = Players:FindFirstChild(selectedPlayer)
        local targetHrp = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        local myHrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        
        if myHrp and targetHrp then
            myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 3, 0) -- Te tpea 3 studs arriba para no bugearte
            Rayfield:Notify({Title = "Teleport", Content = "Te has tpeado con éxito a " .. selectedPlayer, Duration = 2})
        else
            Rayfield:Notify({Title = " Error", Content = "El jugador no tiene Character o está muerto", Duration = 3})
        end
    end,
})

-- Botón Manual de Refresh (Por si acaso)
MainTab:CreateButton({
    Name = " Actualizar Lista Manual",
    Callback = function()
        updatePlayerList()
        PlayerDropdown:Refresh(playerList, true) -- Refresca las opciones visuales del UI
        Rayfield:Notify({Title = " Lista Actualizada", Content = "Se escanearon los jugadores del servidor", Duration = 2})
    end,
})

-- AUTOMÁTICO: Auto-Refresh cuando alguien entra o sale del servidor
local function autoRefresh()
    updatePlayerList()
    PlayerDropdown:Refresh(playerList, false)
end

Players.PlayerAdded:Connect(autoRefresh)
Players.PlayerRemoving:Connect(autoRefresh)
local StatsTab = Window:CreateTab("Auto Stats ", 6031075938)
local StatSection = StatsTab:CreateSection("Upgrade Settings")

--  Lista de estad sticas
local function GetAutoStatsList()
    return {
        "vitality", "healing", "strength", "energy", "flight", "speed",
        "climbing", "swinging", "fireball", "frost", "lightning", "power",
        "telekinesis", "shield", "laserVision", "metalSkin"
    }
end

-- ?? Dropdown para seleccionar la estad stica
local StatDropdown = StatsTab:CreateDropdown({
    Name = "Select Stat",
    Options = GetAutoStatsList(),
    CurrentOption = {"vitality"}, -- Valor por defecto
    MultipleOptions = false,
    Flag = "SelectedStatFlag",
    Callback = function(Option)
        selectedstat = Option[1]
        Rayfield:Notify({
            Title = "? Stat seleccionada",
            Content = "Has elegido: " .. tostring(selectedstat),
            Duration = 3.5
        })
    end,
})

-- ?? Cantidades de mejora
local upgradeAmounts = {10, 20, 30, 40, 50, 100, 150, 300, 450, 600, 800, 1000, 1500, 2000, 3000, 6000, 8000, 10000, 15000, 20000, 30000, 40000, 1000000000}

-- ?? Botones de mejora autom tica
for _, amount in ipairs(upgradeAmounts) do
    StatsTab:CreateButton({
        Name = "Upgrade " .. amount .. "x",
        Callback = function()
            if selectedstat then
                for i = 1, amount do
                    task.spawn(function()
                        game:GetService("ReplicatedStorage").Events.UpgradeAbility:InvokeServer(selectedstat)
                    end)
                end
                Rayfield:Notify({
                    Title = " Puntos completados",
                    Content = "Se mejor  '" .. selectedstat .. "' " .. amount .. " veces.",
                    Duration = 2
                })
            else
                Rayfield:Notify({
                    Title = " No seleccionaste nada",
                    Content = "Selecciona una antes de mejorar.",
                    Duration = 2
                })
            end
        end,
    })
end
