# esx_prioritycooldown
ESX Compatible Crime Status Script


## Changelog



## Features
* Command restricted only for police personnel (players with police job)
* Re-syncs crime status for players
* Discord Webhook
* Locale Support (you have to translate for your language)

## Commands
- /safe - Sets the crime status to Safe
- /cooldown - Sets the crime status to a 15 minute cooldown (default)
- /inprogress - Sets the crime status to Inprogress
- /resetpcd - Empties the cooldown timer out. 

## Usage
- Responding to a crime situation or on-going crime scenario, use ```/inprogress```
- Taking a break from responding to any crime after one had just finished, use ```/cooldown```. Once the timer hits 0 mins, hit ```/safe```

## To Install
1. Download the Initial Release
2. Extract the zip into your server resources
3. Add ```start esx_prioritycooldown``` in your server.cfg

## Modifications
### Changing the Cooldown Timer
Open the ```server.lua``` and change the ```timermax``` value to your desired number of minutes + 1. If you want a cooldown timer of 10 minutes, set it to 11. (Default value = 16)
### Changing the required job to trigger the command
You can modify the required job in the following lines in ```server.lua```
- line 8
- line 20
- line 32
- line 44
### Changing the notification that shows for non-police personnel who attempt to use the command
Modify the else function on the following lines in ```server.lua```
- line 12
- line 24
- line 36
- line 47

### Modifying the chat message when the status changes
Modify in these lines in ```server.lua```
- line 72
- line 104

## Requirements
- es_extended 1.2
- chat
## Credits
Credits to Scott_UK & LanceGood for the initial script-release and basis for modifications.
https://forum.cfx.re/t/release-priority-cooldown/72856

