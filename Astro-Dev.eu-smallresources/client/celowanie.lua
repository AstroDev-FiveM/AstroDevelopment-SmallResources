local shot = false
local check = false
local check2 = false
local count = 0

Citizen.CreateThread(function()
	while true do -- petelka
		SetBlackout(false)
		Citizen.Wait( 1 )
        if Config.CelowaniePierwsza then
		if IsPlayerFreeAiming(PlayerId()) then -- sprawdzenie czy gracz celuje 
		    if GetFollowPedCamViewMode() == 4 and check == false then -- sprawdzanie czy camera = 4 jezeli nie to -
			    check = false
			else
			    SetFollowPedCamViewMode(4) -- zmiana kamery na pierwszą
			    check = true
			end
		else
		    if check == true then
		        SetFollowPedCamViewMode(1) -- zmiana kamery na 3
				check = false
			end
		end
    end
	end
end )



Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		if Config.CelowaniePierwsza then
		if IsPedShooting(PlayerPedId()) and shot == false and GetFollowPedCamViewMode() ~= 4 then -- jeżeli ped strzeli i ma inną kamere niz pierwszo os to zmienia mu na pierwszo os 
			check2 = true
			shot = true
			SetFollowPedCamViewMode(4) -- zmiana kamery na pierwszą
		end
		
		if IsPedShooting(PlayerPedId()) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end
		
		if not IsPedShooting(PlayerPedId()) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(PlayerPedId()) and shot == true then
			if not IsPedShooting(PlayerPedId()) and shot == true and count > 20 then
		        if check2 == true then
				    check2 = false
					shot = false
					SetFollowPedCamViewMode(1) -- zmiana kamery na trzecią
				end
			end
		end	
    end    
	end
end )