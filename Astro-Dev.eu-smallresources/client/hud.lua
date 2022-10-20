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
        SetBlipAlpha(GetNorthRadarBlip(), 0) -- usuwa znaczek N
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end
end)

-- Usuwanie minimapki w momencie gdy gracz nie jest w pojeździe 

CreateThread(function()
  if Config.Minimapa then 
  while true do
    DisplayRadar(GetVehiclePedIsIn(PlayerPedId(), false) > 0)
    Wait(500)
   end
  end
end)
