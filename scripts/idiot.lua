local Players = game:GetService("Players")

local Lighting = game:GetService("Lighting")

local Debris = game:GetService("Debris")

Lighting.Brightness = 0

Lighting.Ambient = Color3.fromRGB(50, 0, 0)

Lighting.OutdoorAmbient = Color3.fromRGB(30, 0, 0)

Lighting.FogEnd = 50

Lighting.FogColor = Color3.fromRGB(20, 0, 0)

local ambianceMusic = Instance.new("Sound")

ambianceMusic.SoundId = "rbxassetid://7266001792"

ambianceMusic.Looped = true

ambianceMusic.Volume = 0.8

ambianceMusic.Parent = game.Workspace

ambianceMusic:Play()

local function createFire(position)

    local fire = Instance.new("Fire")

    fire.Parent = game.Workspace

    fire.Heat = 25

    fire.Size = 10

    fire.Color = Color3.fromRGB(255, 100, 0)

    fire.SecondaryColor = Color3.fromRGB(255, 0, 0)

    fire.Enabled = true

    if position then

        fire.Parent = Instance.new("Part")

        fire.Parent.Transparency = 1

        fire.Parent.CanCollide = false

        fire.Parent.Anchored = true

        fire.Parent.Position = position

        fire.Parent.Parent = game.Workspace

    else

        local randomX = math.random(-500, 500)

        local randomZ = math.random(-500, 500)

        local part = Instance.new("Part")

        part.Size = Vector3.new(1, 1, 1)

        part.Transparency = 1

        part.CanCollide = false

        part.Anchored = true

        part.Position = Vector3.new(randomX, 1, randomZ)

        part.Parent = game.Workspace

        fire.Parent = part

    end

end

for i = 1, 200 do

    createFire()

end

local function createMeteor()

    local meteor = Instance.new("Part")

    meteor.Shape = Enum.PartType.Ball

    meteor.Size = Vector3.new(10, 10, 10)

    meteor.BrickColor = BrickColor.new("Dark stone Grey")

    meteor.Material = Enum.Material.Slate

    meteor.CanCollide = true

    meteor.Anchored = false

    meteor.Parent = game.Workspace

    local randomX = math.random(-500, 500)

    local randomZ = math.random(-500, 500)

    meteor.Position = Vector3.new(randomX, 500, randomZ)

    local fireOnMeteor = Instance.new("Fire")

    fireOnMeteor.Parent = meteor

    fireOnMeteor.Heat = 50

    fireOnMeteor.Size = 15

    fireOnMeteor.Color = Color3.fromRGB(255, 100, 0)

    fireOnMeteor.SecondaryColor = Color3.fromRGB(255, 0, 0)

    fireOnMeteor.Enabled = true

    local trail = Instance.new("Trail")

    trail.Parent = meteor

    trail.Color = ColorSequence.new(Color3.fromRGB(100, 0, 0), Color3.fromRGB(0, 0, 0))

    trail.Lifetime = 2

    trail.Texture = "rbxassetid://13045610280"

    trail.LightInfluence = 0

    trail.Enabled = true

    meteor.Touched:Connect(function(hit)

        if hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid") then

            hit.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(100)

        end

        local explosion = Instance.new("Explosion")

        explosion.Position = meteor.Position

        explosion.BlastRadius = 30

        explosion.BlastPressure = 100000

        explosion.Parent = game.Workspace

        Debris:AddItem(meteor, 0.1)

    end)

    Debris:AddItem(meteor, 10)

end

while true do

    task.wait(math.random(2, 7))

    createMeteor()

end

local function suddenReset(player)

    if player and player.Character then

        player.Character:BreakJoints()

        player:LoadCharacter()

    end

end

while true do

    local playersInGame = Players:GetPlayers()

    if #playersInGame > 0 then

        local randomPlayer = playersInGame[math.random(1, #playersInGame)]

        suddenReset(randomPlayer)

    end

    task.wait(math.random(15, 40))

end

local function applyCustomDance(character)

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then return end

    for _, animTrack in pairs(humanoid:GetPlayingAnimationTracks()) do

        animTrack:Stop()

    end

    local rightArm = character:FindFirstChild("Right Arm")

    local leftArm = character:FindFirstChild("Left Arm")

    local head = character:FindFirstChild("Head")

    if rightArm and leftArm and head then

        local rightArmMotor = character:FindFirstChild("RightUpperArm"):FindFirstChildOfClass("Motor6D")

        local leftArmMotor = character:FindFirstChild("LeftUpperArm"):FindFirstChildOfClass("Motor6D")

        if rightArmMotor and leftArmMotor then

            rightArmMotor.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(0, math.pi/2, 0)

            leftArmMotor.C0 = CFrame.new(0, 1, 0) * CFrame.Angles(0, -math.pi/2, 0)

        end

        local headMotor = character:FindFirstChild("Head"):FindFirstChildOfClass("Motor6D")

        if headMotor then

            local originalC0 = headMotor.C0

            local angle = 0

            local direction = 1

            local speed = 0.05

            local maxAngle = math.pi/8

            spawn(function()

                while true do

                    angle = angle + direction * speed

                    if angle > maxAngle or angle < -maxAngle then

                        direction = -direction

                    end

                    headMotor.C0 = originalC0 * CFrame.Angles(0, angle, 0)

                    task.wait(0.01)

                end

            end)

        end

    end

end

Players.PlayerAdded:Connect(function(player)

    player.CharacterAdded:Connect(function(character)

        task.wait(1)

        applyCustomDance(character)

    end)

    if player.Character then

        applyCustomDance(player.Character)

    end

end)

for _, player in pairs(Players:GetPlayers()) do

    if player.Character then

        applyCustomDance(player.Character)

    end

end
