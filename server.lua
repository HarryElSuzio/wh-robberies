ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('wh-robberies:ReceiveMonies')
AddEventHandler('wh-robberies:ReceiveMonies', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	xPlayer.addMoney(amount)
end)

RegisterServerEvent('wh-robberies:cops', robtype, store)
AddEventHandler('wh-robberies:cops', function(robtype, store)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	local locationLastRobbed

	local cops = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end

	if Config.CashRegLocations[store] then
		locationLastRobbed = Config.CashRegLocations[store]
	elseif Config.SafeLocations[store] then
		locationLastRobbed = Config.SafeLocations[store]
	elseif Config.VaultLocations[store] then
		locationLastRobbed = Config.VaultLocations[store]
	end

	if robtype == "cashreg" then
		if cops >= Config.CashRegCops then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.CashRegCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This has already been robbed, nothing left!'})
			else
				TriggerClientEvent('wh-robberies:cashregrob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not Enough Cops!'})
		end

	elseif robtype == "safe" then
		if cops >= Config.SafeCops then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.SafeCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This has already been robbed, nothing left!'})
			else
				TriggerClientEvent('wh-robberies:saferob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not Enough Cops!'})
		end

	elseif robtype == "vault" then
		if cops >= Config.VaultCops then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.VaultCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This has already been robbed, nothing left!'})
			else
				TriggerClientEvent('wh-robberies:vaultrob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not Enough Cops!'})
		end
	end
end)

RegisterServerEvent('wh-robberies:completed', store)
AddEventHandler('wh-robberies:completed', function(store)
	local locationRobbed
	if Config.CashRegLocations[store] then
		locationRobbed = Config.CashRegLocations[store]
		locationRobbed.lastRobbed = os.time()
	elseif Config.SafeLocations[store] then
		locationRobbed = Config.SafeLocations[store]
		locationRobbed.lastRobbed = os.time()
	elseif Config.VaultLocations[store] then
		locationRobbed = Config.VaultLocations[store]
		locationRobbed.lastRobbed = os.time()
	end
end)
