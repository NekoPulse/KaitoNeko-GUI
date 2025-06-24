local Players = game:GetService("Players")

local Debris = game:GetService("Debris")

local musicTrackIds = {

    "14366981664",

    "14366982317",

    "14366983134",

    "14366982638",

    "14884824216",

    "13629054031",

    "14366980307",

    "14366983305",

    "14366980104",

    "14366980114",

    "13629053065",

    "14366981280",

    "15689459174",

    "15689458906",

    "15689453166",

    "15689450859",

    "15689440479",

    "15689451063",

    "15689453529",

    "14884822914",

    "14884210838",

    "15689451790",

    "15689449215",

    "15689453751",

    "14884823494",

    "15689455568",

    "15689450321",

    "14884822465",

    "15689453973",

    "15689450026",

    "14884816658",

    "15689455422",

    "15689440636",

    "15689439571",

    "15957461869",

    "15689456690",

    "15689457918",

    "15689454417",

    "15689455025",

    "15689446558",

    "15689455911",

    "15689448876",

    "15689446882",

    "15689448332",

    "15689451802",

    "15689443344",

    "15689440113",

    "15689439126",

    "15689442404",

    "15689440220",

    "15689440376",

    "15689444364",

    "15689442874",

    "15689439895",

    "15689441772",

    "15689444163",

    "15689441541",

    "15689445244",

    "15689446096",

    "15689449597",

    "14366983688",

    "14366981962",

    "15689453336",

    "15689456335",

    "13629050392",

    "13629053495",

    "14884817162"

}

local currentSound = nil

local function playNextSong()

    if currentSound then

        currentSound:Stop()

        currentSound:Destroy()

    end

    local randomIndex = math.random(1, #musicTrackIds)

    local selectedTrackId = musicTrackIds[randomIndex]

    currentSound = Instance.new("Sound")

    currentSound.SoundId = "rbxassetid://" .. selectedTrackId

    currentSound.Looped = false

    currentSound.Volume = 0.8

    currentSound.Parent = game.Workspace

    currentSound:Play()

    currentSound.Ended:Connect(playNextSong)

end

playNextSong()
