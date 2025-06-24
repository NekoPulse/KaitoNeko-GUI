local Players = game:GetService("Players")

local Lighting = game:GetService("Lighting")

local Debris = game:GetService("Debris")

Lighting.Brightness = 0

Lighting.Ambient = Color3.fromRGB(50, 0, 0)

Lighting.OutdoorAmbient = Color3.fromRGB(30, 0, 0)

Lighting.FogEnd = 50

Lighting.FogColor = Color3.fromRGB(20, 0, 0)

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
