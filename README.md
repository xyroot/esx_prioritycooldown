# esx_prioritycooldown
ESX Compatible Crime Status Script


# Changelog
## esx_prioritycooldown v1.0 [03-26-21]
* Added Config File (no need to manually go through client and server luas to make changes)
* Added Support for Locales and Translations
* Added Discord Webhook (optional)
* Reworked 2d text draw
* Used ESX notification (bottom-left) instead of the old one (top-left)
### Configuration
* Set your desired locale (default: en)
* Allowed job (single not multiple) (default: police)
* Set your own timer in mins (default: 15)
* Set your own resync time in seconds (default: 5)
* Customizable Discord Webhook (Title, Footer, Footer Image & Color)
* Webhook language is controlled via selected locale

### Locales
* EN
* You are free to add your own translations. If you've already made your own and want to integrate, please do a merge request

### Future Plans
I may not be updating this for a while, due to the fact that better priority scripts have already been created.
However, if I do come back to it, I may work on the following:
* Support for multiple jobs
* Support for admins to use the commands regardless of the job 
* Support for robbery integration


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

## Requirements
- es_extended 1.2
- chat
## Credits
Credits to Scott_UK & LanceGood for the initial script-release and basis for modifications.
https://forum.cfx.re/t/release-priority-cooldown/72856

