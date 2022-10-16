Citizen.CreateThread(function()
    if Config.Pociagi then
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    SetTrainTrackSpawnFrequency(0, 120000) 
    SetRandomTrains(1)
    SetTrainsForceDoorsOpen(false)
    end
end)

CreateThread(function()
    if Config.CustomoweFaleWoda then
    local value = 0.5
    while true do
    WaterOverrideSetStrength(value)
    Wait()
    end
    end
end)
