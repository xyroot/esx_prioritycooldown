ESX = nil
local PlayerData = {}
local status = 1 --Status 1 = Safe, Status 2 = In Progress, Status 3 = Cooldown | Defaults to 1 at the start of the script.

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('safe', 'user', function(xPlayer, args, showError)
	if xPlayer.job.name == 'police' then
	    status = 1
		TriggerEvent('isPriority')
	else
	xPlayer.showHelpNotification('You are not a police officer!', false, true, 10000)	
	end
			
end, true, {help = "", validate = false, arguments = {
	{name = '', help = '', type = ''}
}})

ESX.RegisterCommand('cooldown', 'user', function(xPlayer, args, showError)
	if xPlayer.job.name == 'police' then
	 status = 3
	 TriggerEvent("cooldownt")
	else
	xPlayer.showHelpNotification('You are not a police officer!', false, true, 10000)	
	end
			
end, true, {help = "", validate = false, arguments = {
	{name = '', help = '', type = ''}
}})

ESX.RegisterCommand('inprogress', 'user', function(xPlayer, args, showError)
	if xPlayer.job.name == 'police' then
	 status = 2
	 TriggerEvent('isOnHold')
	else
	xPlayer.showHelpNotification('You are not a police officer!', false, true, 10000)	
	end
			
end, true, {help = "", validate = false, arguments = {
	{name = '', help = '', type = ''}
}})

ESX.RegisterCommand('resetpcd', 'user', function(xPlayer, args, showError)
	if xPlayer.job.name == 'police' then
	 TriggerEvent("cancelcooldown")
	else
	xPlayer.showHelpNotification('You are not a police officer!', false, true, 10000)	
	end
			
end, true, {help = "", validate = false, arguments = {
	{name = '', help = '', type = ''}
}})






-- Config
timermax = 16 -- In minutes. Must be one bigger than the max timer you want (Eg if you want 20 it must be 21)

-- Do not touch
cooldown = 0
ispriority = false
ishold = false

RegisterNetEvent('isPriority')
AddEventHandler('isPriority', function()
	ispriority = true
	Citizen.Wait(1)
	TriggerClientEvent('UpdatePriority', -1, ispriority)
	TriggerClientEvent('chatMessage', -1, "SAFE & CLEAR", {255, 0, 0},  "^7City is safe for a moment, any crimes and robbery can happen anytime,  ^7Stay safe everyone!")
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
		TriggerClientEvent('chatMessage', -1, "WARNING", {255, 0, 0}, "^1A priority call was just conducted. ^3All civilians must wait 15 minutes before conducting another one. ^7Failure to abide by this rule will lead to you being ^1comserv.")
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

--Refresh the statuses to create sync for newly joined players and de-synced players | Refreshes every 5 seconds.
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000) -- 5 seconds, adjust as you want.
		-- print('Current Status :'..status)
		if status == 1 then
			-- print('Refreshing to Safe')
			TriggerEvent('isPriorityRefresh')
		elseif status == 3 then
			-- print('Refreshing to Cooldown')
			TriggerClientEvent('UpdateCooldown', -1, cooldown)
		elseif status == 2 then
			-- print('Refreshing to In PROGRESS')
			TriggerEvent('isOnHold')
		end
	end
end)
