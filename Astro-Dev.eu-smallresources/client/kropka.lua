Citizen.CreateThread(function()
    while true do
        if Config.WylaczKropka then 
           HideHudComponentThisFrame( 14 ) 
        end
        Citizen.Wait( 0 )
    end 
end)

