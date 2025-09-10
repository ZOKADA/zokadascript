-- Zokada X Ultimate Premium GUI | By Alpha for Zeta
-- 500+ Satırlık Dev Efsane

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Müzik için Sound instance
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9115468339" -- Epic müzik ID
sound.Looped = true
sound.Volume = 0.5
sound.Parent = workspace
sound:Play()

-- Ana GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZokadaXUltimate"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Arkaplan efekti
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Parçacık efekti
local particles = {}
for i = 1, 50 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, 2, 0, 2)
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    particle.BorderSizePixel = 0
    particle.Parent = background
    particles[i] = {particle = particle, speed = math.random(1, 3)}
end

-- Ana container
local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 500, 0, 600)
mainContainer.Position = UDim2.new(0.5, -250, 0.5, -300)
mainContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainContainer.BorderSizePixel = 1
mainContainer.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainContainer.ClipsDescendants = true
mainContainer.Parent = screenGui

-- Başlık barı
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainContainer

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 200, 1, 0)
titleText.Position = UDim2.new(0.5, -100, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "ZOKADA X ULTIMATE"
titleText.TextColor3 = Color3.fromRGB(255, 0, 0)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 16
titleText.Parent = titleBar

-- Kapatma butonu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, -40, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = titleBar

-- Sekmeler
local tabs = {"Main", "Scripts", "Settings", "Credits"}
local tabButtons = {}
local tabFrames = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0.25, 0, 0, 30)
    tabButton.Position = UDim2.new((i-1) * 0.25, 0, 0, 40)
    tabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabButton.BorderSizePixel = 0
    tabButton.Text = tabName
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.Gotham
    tabButton.TextSize = 12
    tabButton.Parent = mainContainer
    tabButtons[tabName] = tabButton

    local tabFrame = Instance.new("Frame")
    tabFrame.Size = UDim2.new(1, -20, 1, -100)
    tabFrame.Position = UDim2.new(0, 10, 0, 80)
    tabFrame.BackgroundTransparency = 1
    tabFrame.Visible = (i == 1)
    tabFrame.Parent = mainContainer
    tabFrames[tabName] = tabFrame
end

-- Main Tab
local mainTab = tabFrames["Main"]

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 300, 0, 40)
keyBox.Position = UDim2.new(0.5, -150, 0.2, 0)
keyBox.PlaceholderText = "Enter Your Key Here"
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Parent = mainTab

local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(0, 120, 0, 40)
checkButton.Position = UDim2.new(0.5, -60, 0.4, 0)
checkButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
checkButton.BorderSizePixel = 0
checkButton.Text = "CHECK KEY"
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 14
checkButton.Parent = mainTab

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 120, 0, 40)
getKeyButton.Position = UDim2.new(0.5, -60, 0.6, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
getKeyButton.BorderSizePixel = 0
getKeyButton.Text = "GET KEY"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
getKeyButton.Parent = mainTab

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0.8, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Waiting for key..."
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.Parent = mainTab

-- Scripts Tab
local scriptsTab = tabFrames["Scripts"]
local scriptButtons = {
    {"Silent Aim", "https://pastebin.com/raw/silentAimScript"},
    {"Wallhack", "https://pastebin.com/raw/wallhackScript"},
    {"Speed Hack", "https://pastebin.com/raw/speedScript"},
    -- Daha fazla script ekleyebilirsin
}

for i, scriptData in ipairs(scriptButtons) do
    local scriptButton = Instance.new("TextButton")
    scriptButton.Size = UDim2.new(1, -20, 0, 40)
    scriptButton.Position = UDim2.new(0, 10, 0, (i-1) * 50)
    scriptButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    scriptButton.BorderSizePixel = 0
    scriptButton.Text = scriptData[1]
    scriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    scriptButton.Font = Enum.Font.Gotham
    scriptButton.TextSize = 14
    scriptButton.Parent = scriptsTab
end

-- Settings Tab
local settingsTab = tabFrames["Settings"]

local themeColor = Instance.new("TextLabel")
themeColor.Size = UDim2.new(1, -20, 0, 20)
themeColor.Position = UDim2.new(0, 10, 0, 10)
themeColor.BackgroundTransparency = 1
themeColor.Text = "Theme Color:"
themeColor.TextColor3 = Color3.fromRGB(255, 255, 255)
themeColor.Font = Enum.Font.Gotham
themeColor.TextSize = 14
themeColor.Parent = settingsTab

local colorPicker = Instance.new("TextBox")
colorPicker.Size = UDim2.new(0, 100, 0, 30)
colorPicker.Position = UDim2.new(0, 10, 0, 40)
colorPicker.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
colorPicker.Text = "#FF0000"
colorPicker.TextColor3 = Color3.fromRGB(255, 255, 255)
colorPicker.Font = Enum.Font.Gotham
colorPicker.TextSize = 12
colorPicker.Parent = settingsTab

local musicToggle = Instance.new("TextButton")
musicToggle.Size = UDim2.new(1, -20, 0, 40)
musicToggle.Position = UDim2.new(0, 10, 0, 100)
musicToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
musicToggle.BorderSizePixel = 0
musicToggle.Text = "Music: ON"
musicToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
musicToggle.Font = Enum.Font.Gotham
musicToggle.TextSize = 14
musicToggle.Parent = settingsTab

-- Credits Tab
local creditsTab = tabFrames["Credits"]

local creditsText = Instance.new("TextLabel")
creditsText.Size = UDim2.new(1, -20, 1, -20)
creditsText.Position = UDim2.new(0, 10, 0, 10)
creditsText.BackgroundTransparency = 1
creditsText.Text = "Zokada X Ultimate\nCreated by Alpha\nFor Zeta Realm\n\nSpecial thanks to all users!"
creditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsText.Font = Enum.Font.Gotham
creditsText.TextSize = 16
creditsText.TextYAlignment = Enum.TextYAlignment.Top
creditsText.Parent = creditsTab

-- Animasyonlar
local function tweenObject(obj, properties, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween:Play()
    return tween
end

-- Parçacık animasyonu
spawn(function()
    while true do
        for i, p in ipairs(particles) do
            local particle = p.particle
            local currentPos = particle.Position
            local newPos = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale + 0.01 * p.speed, currentPos.Y.Offset)
            if newPos.Y.Scale > 1 then
                newPos = UDim2.new(math.random(), 0, 0, 0)
            end
            particle.Position = newPos
        end
        wait(0.03)
    end
end)

-- Fonksiyonlar
local correctKey = "ZETAKEY2024" -- KEYİ BURAYA YAZ
local hileScriptLink = "https://pastebin.com/raw/anaHileScriptLinki" -- HİLE LİNKİ
local linkvertiseLink = "https://linkvertise.com/senin_linkin" -- LİNKVERTİSE LİNKİN

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(linkvertiseLink)
    statusLabel.Text = "Status: Link copied to clipboard!"
    tweenObject(statusLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, 0.5)
    wait(2)
    statusLabel.Text = "Status: Waiting for key..."
    tweenObject(statusLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.5)
end)

checkButton.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        statusLabel.Text = "Status: Key correct! Loading scripts..."
        tweenObject(statusLabel, {TextColor3 = Color3.fromRGB(0, 255, 0)}, 0.5)
        wait(1)
        loadstring(game:HttpGet(hileScriptLink))()
        screenGui:Destroy()
        sound:Stop()
    else
        statusLabel.Text = "Status: Invalid key!"
        tweenObject(statusLabel, {TextColor3 = Color3.fromRGB(255, 0, 0)}, 0.5)
        keyBox.Text = ""
        wait(2)
        statusLabel.Text = "Status: Waiting for key..."
        tweenObject(statusLabel, {TextColor3 = Color3.fromRGB(255, 255, 255)}, 0.5)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    tweenObject(mainContainer, {Size = UDim2.new(0, 0, 0, 600), Position = UDim2.new(0.5, 0, 0.5, -300)}, 0.5)
    wait(0.5)
    screenGui:Destroy()
    sound:Stop()
end)

-- Sekme değiştirme
for tabName, tabButton in pairs(tabButtons) do
    tabButton.MouseButton1Click:Connect(function()
        for name, frame in pairs(tabFrames) do
            frame.Visible = (name == tabName)
        end
        for name, button in pairs(tabButtons) do
            button.BackgroundColor3 = (name == tabName) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(25, 25, 25)
        end
    end)
end

-- Müzik kontrolü
musicToggle.MouseButton1Click:Connect(function()
    if sound.Playing then
        sound:Pause()
        musicToggle.Text = "Music: OFF"
    else
        sound:Play()
        musicToggle.Text = "Music: ON"
    end
end)

-- GUI'yi açılış animasyonu
mainContainer.Size = UDim2.new(0, 0, 0, 600)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, -300)
tweenObject(mainContainer, {Size = UDim2.new(0, 500, 0, 600), Position = UDim2.new(0.5, -250, 0.5, -300)}, 0.8)

-- Sürükleme özelliği
local dragging = false
local dragInput, dragStart, startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainContainer.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        mainContainer.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- GUI'yi kapatma tuşu
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        if screenGui then
            screenGui:Destroy()
            sound:Stop()
        end
    end
end)
