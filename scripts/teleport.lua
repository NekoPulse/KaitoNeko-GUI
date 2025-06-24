local TeleportService = game:GetService("TeleportService")

local Players = game:GetService("Players")

local CoreGui = game:GetService("CoreGui")

local screenGui = Instance.new("ScreenGui")

screenGui.Name = "TeleportControl_Delta"

screenGui.ResetOnSpawn = false

screenGui.Parent = CoreGui

local gameIDTextBox = Instance.new("TextBox")

gameIDTextBox.Name = "GameIDTextBox_Input"

gameIDTextBox.Size = UDim2.new(0.25, 0, 0.05, 0)

gameIDTextBox.Position = UDim2.new(0.375, 0, 0.4, 0)

gameIDTextBox.PlaceholderText = "Enter Place ID here"

gameIDTextBox.TextScaled = true

gameIDTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

gameIDTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)

gameIDTextBox.BorderColor3 = Color3.fromRGB(20, 20, 20)

gameIDTextBox.BorderSizePixel = 2

gameIDTextBox.Font = Enum.Font.SourceSansBold

gameIDTextBox.ClearTextOnFocus = true

gameIDTextBox.Parent = screenGui

local teleportButton = Instance.new("TextButton")

teleportButton.Name = "TeleportButton_Activate"

teleportButton.Size = UDim2.new(0.15, 0, 0.05, 0)

teleportButton.Position = UDim2.new(0.425, 0, 0.47, 0)

teleportButton.Text = "Teleport"

teleportButton.TextScaled = true

teleportButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)

teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)

teleportButton.BorderColor3 = Color3.fromRGB(0, 100, 0)

teleportButton.BorderSizePixel = 2

teleportButton.Font = Enum.Font.SourceSansBold

teleportButton.Parent = screenGui

teleportButton.Activated:Connect(function()

    local placeIdText = gameIDTextBox.Text

    local placeId = tonumber(placeIdText)

    if placeId and placeId > 0 then

        local playersInGame = Players:GetPlayers()

        if #playersInGame > 0 then

            warn("Attempting to teleport " .. #playersInGame .. " players to Place ID: " .. placeId)

            TeleportService:TeleportPartyAsync(placeId, playersInGame)

        else

            warn("No players detected in this server to teleport!")

            gameIDTextBox.Text = "No players!"

            task.wait(1)

            gameIDTextBox.Text = ""

        end

    else

        warn("Invalid Place ID entered: " .. placeIdText)

        gameIDTextBox.Text = "Invalid ID!"

        task.wait(1)

        gameIDTextBox.Text = ""

    end

end)

warn("Teleport GUI loaded for Delta Executor.")
