local robbing = false
local robbinglocation = nil
local camera = nil
local robbinglocation2 = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function InCashRegZone(coords)
    Location = Config.CashRegLocations
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].x, Location[i].y, Location[i].z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Cameras then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

function InSafeZone(coords)
    Location = Config.SafeLocations
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].x, Location[i].y, Location[i].z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Cameras then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

function InVaultZone(coords)
    Location = Config.VaultLocations
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].x, Location[i].y, Location[i].z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Cameras then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        -- Cash Registers
        if Config.EnableCashReg then
	        if InCashRegZone(coords) then
				if IsControlJustReleased(0, Config.Control) and IsInputDisabled(0) then
					print("Pressed")
					TriggerServerEvent('wh-robberies:cops', "cashreg", robbinglocation2)
				end
			end
		end

		-- Safes
		if Config.EnableSafe then
			if InSafeZone(coords) then
				if IsControlJustReleased(0, Config.Control) and IsInputDisabled(0) then
					TriggerServerEvent('wh-robberies:cops', "safe", robbinglocation2)
				end
			end
		end

		-- Vaults
		if Config.EnableVault then
			if InVaultZone(coords) then
				if IsControlJustReleased(0, Config.Control) and IsInputDisabled(0) then
					TriggerServerEvent('wh-robberies:cops', "vault", robbinglocation2)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        if Config.EnableCashReg then
	        for k, v in pairs(Config.CashRegLocations) do
	            if GetDistanceBetweenCoords(coords, Config.CashRegLocations[k].x, Config.CashRegLocations[k].y, Config.CashRegLocations[k].z, true) < 1.5  then
	                ESX.Game.Utils.DrawText3D(vector3(Config.CashRegLocations[k].x, Config.CashRegLocations[k].y, Config.CashRegLocations[k].z + 1.0), "Press ~r~[Z]~s~ to Rob Cash Register", 0.6)
	                robbinglocation2 = k
	            end
	        end
	    end

	    if Config.EnableSafe then
	        for k, v in pairs(Config.SafeLocations) do
	            if GetDistanceBetweenCoords(coords, Config.SafeLocations[k].x, Config.SafeLocations[k].y, Config.SafeLocations[k].z, true) < 1.5 then
	                ESX.Game.Utils.DrawText3D(vector3(Config.SafeLocations[k].x, Config.SafeLocations[k].y, Config.SafeLocations[k].z + 1.0), "Press ~r~[Z]~s~ to Rob Safe", 0.6)
	                robbinglocation2 = k
	            end
	        end
	    end

	    if Config.EnableVault then
	        for k, v in pairs(Config.VaultLocations) do
	            if GetDistanceBetweenCoords(coords, Config.VaultLocations[k].x, Config.VaultLocations[k].y, Config.VaultLocations[k].z, true) < 1.5 then
	                ESX.Game.Utils.DrawText3D(vector3(Config.VaultLocations[k].x, Config.VaultLocations[k].y, Config.VaultLocations[k].z + 1.0), "Press ~r~[Z]~s~ to Rob the Vault", 0.6)
	                robbinglocation2 = k
	            end
	        end
	    end
	end
end)


RegisterNetEvent('wh-robberies:cashregrob')
AddEventHandler('wh-robberies:cashregrob', function()
	player = GetPlayerPed(-1)
    coords = GetEntityCoords(player)
	if Config.NotifyPolice then
		if Config.Cameras then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A and D to move. W to accept, S to cancel', 7000)
	--Citizen.Wait(200)
	local res = exports['wh-robberies']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		local amount = math.random(Config.CashRegMin,Config.CashRegMax)
		print(amount)
		Citizen.Wait(100)
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('wh-robberies:ReceiveMonies', amount)
		tostring(amount)
		exports['mythic_notify']:DoHudText('success', 'Completed! You recieved $' .. amount)

		if Config.EnableCooldown then
			TriggerServerEvent('wh-robberies:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Cracking Failed')
	end
end)

RegisterNetEvent('wh-robberies:saferob')
AddEventHandler('wh-robberies:saferob', function()
	if Config.NotifyPolice then
		if Config.Cameras then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A and D to move. W to accept, S to cancel', 7000)
	--Citizen.Wait(200)
	local res = exports['wh-robberies']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		local amount = math.random(Config.SafeMin,Config.SafeMax)
		print(amount)
		Citizen.Wait(100)
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('wh-robberies:ReceiveMonies', amount)
		tostring(amount)
		exports['mythic_notify']:DoHudText('success', 'Completed! You recieved $' .. amount)

		if Config.EnableCooldown then
			TriggerServerEvent('wh-robberies:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Cracking Failed')
	end
end)

RegisterNetEvent('wh-robberies:vaultrob')
AddEventHandler('wh-robberies:vaultrob', function()
	if Config.NotifyPolice then
		if Config.Cameras then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A and D to move. W to accept, S to cancel', 7000)
	--Citizen.Wait(200)
	local res = exports['wh-robberies']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		local amount = math.random(Config.VaultMin,Config.VaultMax)
		print(amount)
		Citizen.Wait(100)
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('wh-robberies:ReceiveMonies', amount)
		tostring(amount)
		exports['mythic_notify']:DoHudText('success', 'Completed! You recieved $' .. amount)

		if Config.EnableCooldown then
			TriggerServerEvent('wh-robberies:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Cracking Failed')
	end
end)