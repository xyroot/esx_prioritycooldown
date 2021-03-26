ESX = nil
local PlayerData = {}
local status = 1 --Status 1 = Safe, Status 2 = In Progress, Status 3 = Cooldown | Defaults to 1 at the start of the script.
local msg = ""
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.version == 1.1 then
	TriggerEvent('es:addGroupCommand', 'safe', 'user', function(source, args, user)
		local xPlayer = ESX.GetPlayerFromId(source)
	
		if xPlayer.job.name == Config.allowedJob then
			status = 1
			TriggerEvent('isPriority')
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_safe').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
	end)
	
	TriggerEvent('es:addGroupCommand', 'cooldown', 'user', function(source, args, user)
		local xPlayer = ESX.GetPlayerFromId(source)
	
		if xPlayer.job.name == Config.allowedJob then
			status = 3
			TriggerEvent("cooldownt")
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_cooldown').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
	end)
	
	TriggerEvent('es:addGroupCommand', 'inprogress', 'user', function(source, args, user)
		local xPlayer = ESX.GetPlayerFromId(source)
	
		if xPlayer.job.name == Config.allowedJob then
			status = 2
			TriggerEvent('isOnHold')
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_ongoing').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
	end)
	
	TriggerEvent('es:addGroupCommand', 'resetpcd', 'user', function(source, args, user)
		local xPlayer = ESX.GetPlayerFromId(source)
	
		if xPlayer.job.name == Config.allowedJob then
			TriggerEvent("cancelcooldown")
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_reset').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end		
	end, function(source, args, user)
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
	end)
elseif Config.version == 1.2 then
	ESX.RegisterCommand('safe', 'user', function(xPlayer, args, showError)
		if xPlayer.job.name == Config.allowedJob then
			status = 1
			TriggerEvent('isPriority')
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_safe').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
				
	end, true, {help = "", validate = false, arguments = {
		{name = '', help = '', type = ''}
	}})
	
	ESX.RegisterCommand('cooldown', 'user', function(xPlayer, args, showError)
		if xPlayer.job.name == Config.allowedJob then
			status = 3
			TriggerEvent("cooldownt")
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_cooldown').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
				
	end, true, {help = "", validate = false, arguments = {
		{name = '', help = '', type = ''}
	}})
	
	ESX.RegisterCommand('inprogress', 'user', function(xPlayer, args, showError)
		if xPlayer.job.name == Config.allowedJob then
			status = 2
			TriggerEvent('isOnHold')
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_ongoing').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
				
	end, true, {help = "", validate = false, arguments = {
		{name = '', help = '', type = ''}
	}})
	
	ESX.RegisterCommand('resetpcd', 'user', function(xPlayer, args, showError)
		if xPlayer.job.name == Config.allowedJob then
			TriggerEvent("cancelcooldown")
			if Config.discordLogging then
				local ids = ExtractIdentifiers(xPlayer.source)
				if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
				msg = GetPlayerName(xPlayer.source).._U('set_reset').."\n ".._discordID.."\n **Player ID:** "..xPlayer.source
				sendWebhook(msg)
			end
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('not_allowed')) 
		end
				
	end, true, {help = "", validate = false, arguments = {
		{name = '', help = '', type = ''}
	}})
else
	print('^1[esx_prioritycooldown]: ^7This version of es_extended is not supported. Only supported for 1.1 or 1.2. Check your config.lua ')

end



timermax = Config.timer + 1 -- In minutes. Must be one bigger than the max timer you want (Eg if you want 20 it must be 21)

-- Do not touch
cooldown = 0
ispriority = false
ishold = false

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	ispriority = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('chatMessage', -1, _U('safe_clear'))
end)

RegisterNetEvent('isPriorityRefresh')
AddEventHandler('isPriorityRefresh', function()
	ispriority = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
end)

RegisterNetEvent('isOnHold')
AddEventHandler('isOnHold', function()
	ishold = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdateHold', -1, ishold)
end)

RegisterNetEvent("cooldownt")
AddEventHandler("cooldownt", function()
	if ispriority == true then
		ispriority = false
		TriggerClientEvent('UpdatePriority', -1, ispriority)
	end
	Citizen.Wait(1)
	if ishold == true then
		ishold = false
		TriggerClientEvent('UpdateHold', -1, ishold)
	end
	Citizen.Wait(1)
	if cooldown == 0 then
		cooldown = 0
		cooldown = cooldown + timermax
		TriggerClientEvent('chatMessage', -1, _U('priority_call', Config.timer))
		while cooldown > 0 do
			cooldown = cooldown - 1
			TriggerClientEvent('UpdateCooldown', -1, cooldown)
			Citizen.Wait(60000)
		end
	elseif cooldown ~= 0 then
		CancelEvent()
	end
end)

RegisterNetEvent("cancelcooldown")
AddEventHandler("cancelcooldown", function()
	Citizen.Wait(1)
	while cooldown > 0 do
		cooldown = cooldown - 1
		TriggerClientEvent('UpdateCooldown', -1, cooldown)
		Citizen.Wait(100)
	end
	
end)

--Refresh the statuses to create sync for newly joined players and de-synced players | Refreshes every 5 seconds by default
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.resyncTime * 1000) 
		if status == 1 then
			TriggerEvent('isPriorityRefresh')
		elseif status == 3 then
			TriggerClientEvent('UpdateCooldown', -1, cooldown)
		elseif status == 2 then
			TriggerEvent('isOnHold')
		end
	end
end)