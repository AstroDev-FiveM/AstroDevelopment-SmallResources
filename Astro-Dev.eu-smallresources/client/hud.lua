-- Usuwanie pasków zdrowia i pancerza pod minimapą
Citizen.CreateThread(function()
    if Config.PancerziZdrowie then 
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(1500)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(1500)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end
end)

-- Usuwanie minimapki w momencie gdy gracz nie jest w pojeździe 
Citizen.CreateThread(function()
    if Config.Minimapa then 
    Citizen.Wait(1500)
    while true do
        local sleepThread = 1500
        local radarEnabled = IsRadarEnabled()
        if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
            DisplayRadar(false)
        elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
            DisplayRadar(true)
        end
        Citizen.Wait(sleepThread)
    end
end
end)