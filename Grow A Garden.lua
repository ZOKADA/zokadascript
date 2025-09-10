using System.Drawing;

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZokadaXPremium"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainContainer = Instance.new("Frame")
mainContainer.Size = UDim2.new(0, 450, 0, 400)
mainContainer.Position = UDim2.new(0.5, -225, 0.5, -200)
mainContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainContainer.BorderSizePixel = 0
mainContainer.ClipsDescendants = true
mainContainer.Parent = screenGui

local containerStroke = Instance.new("UIStroke")
containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
containerStroke.Color = Color3.fromRGB(80, 80, 80)
containerStroke.Thickness = 2
containerStroke.Parent = mainContainer

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainContainer

local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0, 200, 1, 0)
titleText.Position = UDim2.new(0.5, -100, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "ZOKADA X PREMIUM"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 14
titleText.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.Gotham
closeButton.TextSize = 14
closeButton.Parent = titleBar

local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -50)
contentFrame.Position = UDim2.new(0, 10, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainContainer

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, 0, 0, 40)
keyBox.Position = UDim2.new(0, 0, 0, 20)
keyBox.PlaceholderText = "Enter Your Key Here"
keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.TextXAlignment = Enum.TextXAlignment.Center
keyBox.Parent = contentFrame

local checkButton = Instance.new("TextButton")
checkButton.Size = UDim2.new(1, 0, 0, 40)
checkButton.Position = UDim2.new(0, 0, 0, 70)
checkButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
checkButton.BorderSizePixel = 0
checkButton.Text = "CHECK KEY"
checkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
checkButton.Font = Enum.Font.GothamBold
checkButton.TextSize = 14
checkButton.Parent = contentFrame

local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(1, 0, 0, 40)
getKeyButton.Position = UDim2.new(0, 0, 0, 120)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
getKeyButton.BorderSizePixel = 0
getKeyButton.Text = "GET KEY"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 14
getKeyButton.Parent = contentFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 170)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Waiting for key..."
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Center
statusLabel.Parent = contentFrame

local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -20)
footer.BackgroundTransparency = 1
footer.Text = "Version: 1.13.1 | Zeta Realm"
footer.TextColor3 = Color3.fromRGB(100, 100, 100)
footer.Font = Enum.Font.Gotham
footer.TextSize = 10
footer.TextXAlignment = Enum.TextXAlignment.Center
footer.Parent = contentFrame

local function tweenObject(obj, properties, duration)
    local tweenInfo = TweenInfo.new (duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, tweenInfo, properties)
    tween: Play()
    return tween
end


local correctKey = "X1y6K4t9Q2r7M5b3Z8v0L6n1P9s3H2" 
local hileScriptLink = "https://pastebin.com/raw/X4UEL3C6" 
local linkvertiseLink = "https://workink.net/24bq/4wi5voqm"

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(linkvertiseLink)
    statusLabel.Text = "Status: Link copied to clipboard!"
    statusLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
    wait(2)
    statusLabel.Text = "Status: Waiting for key..."
    statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
end)

checkButton.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        statusLabel.Text = "Status: Key correct! Loading..."
        statusLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
        wait(1)
        loadstring(game: HttpGet(hileScriptLink))()
        screenGui: Destroy()
    else
    statusLabel.Text = "Status: Invalid key!"
        statusLabel.TextColor3 = Color3.fromRGB(200, 0, 0)
        keyBox.Text = ""
        wait(2)
        statusLabel.Text = "Status: Waiting for key..."
        statusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui: Destroy()
end)

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

mainContainer.Size = UDim2.new(0, 0, 0, 400)
mainContainer.Position = UDim2.new(0.5, 0, 0.5, -200)
tweenObject(mainContainer, { Size = UDim2.new(0, 450, 0, 400), Position = UDim2.new(0.5, -225, 0.5, -200)}, 0.5)
