local cooldown = 0
local ispriority = false
local ishold = false
local screenPosX = 0.165                    -- X coordinate (top left corner of HUD)
local screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)   
local color = {255, 255, 255}

RegisterNetEvent('UpdateCooldown')
AddEventHandler('UpdateCooldown', function(newCooldown)
    cooldown = newCooldown
end)

RegisterNetEvent('UpdatePriority')
AddEventHandler('UpdatePriority', function(newispriority)
    ispriority = newispriority
end)

RegisterNetEvent('UpdateHold')
AddEventHandler('UpdateHold', function(newishold)
    ishold = newishold
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ishold == true then
            drawTxt(_U('crime_ongoing'), 4, color, 0.5, screenPosX + Config.xcoords , screenPosY + Config.ycoords) 
		elseif ispriority == false then
            drawTxt(_U('crime_cooldown', cooldown), 4, color, 0.5, screenPosX + Config.xcoords , screenPosY + Config.ycoords) 
		elseif ispriority == true then
            drawTxt(_U('crime_safe'), 4, color, 0.5, screenPosX + Config.xcoords , screenPosY + Config.ycoords) 
		end
	end
end)
