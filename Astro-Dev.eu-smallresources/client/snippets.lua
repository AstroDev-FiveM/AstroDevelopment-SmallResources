Citizen.CreateThread(function()
	if Config.Pociagi then
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    SetTrainTrackSpawnFrequency(0, 120000) 
    SetRandomTrains(1)
    SetTrainsForceDoorsOpen(false)
	end
end)