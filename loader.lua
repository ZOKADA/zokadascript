using System.Drawing;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.InteropServices.JavaScript.JSType;


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZOKADAXSYSTEM"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 250)-- Yükseklik arttı
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
title.Text = "ZOKADA X SYSTEM"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = mainFrame


local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 300, 0, 40)
keyBox.Position = UDim2.new(0.5, -150, 0.25, -20)
keyBox.PlaceholderText = "Enter The Key Here"
keyBox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Text = ""
keyBox.Parent = mainFrame


local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 120, 0, 40)
submitButton.Position = UDim2.new(0.5, -60, 0.5, -20)
submitButton.Text = "Check Key"
submitButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Parent = mainFrame


local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0, 120, 0, 40)
getKeyButton.Position = UDim2.new(0.5, -60, 0.75, -20)
getKeyButton.Text = "Get Key"
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Parent = mainFrame


local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = mainFrame


local CorrectKey = "k7R2m9X5a3T8b6Q1y4Z0pV9nL3sF7wD2" 


local HileScriptLink = "https://pastebin.com/raw/YCJMUecz" 


local LinkvertiseLink = "https://www.bing.com/images/search?q=zokada&form=HDRSC3&first=1" 


getKeyButton.MouseButton1Click:Connect(function()
    
    setclipboard(LinkvertiseLink)
    
    game: GetService("StarterGui"):SetCore("SendNotification", {
    Title = "KEY LİNK COPİED!",
        Text = "The Link Will Be Pasted And Opened İn The Browser.!",
        Duration = 5
    })
end)

-- Onay butonunun click olayı
submitButton.MouseButton1Click:Connect(function()
    if keyBox.Text == CorrectKey then
        loadstring(game: HttpGet(HileScriptLink))()
        screenGui:Destroy()
    else
        keyBox.Text = "WRONG KEY!"
        keyBox.TextColor3 = Color3.fromRGB(255, 0, 0)
        wait(1.5)
        keyBox.Text = ""
        keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui: Destroy()
end)
