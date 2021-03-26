Config = {}

--ES EXTENDED Version Use 1.1 if you are using es_extended 1.1, 1.2 if you are using es_extended 1.2
Config.version = 1.3 --default 1.2 | set to your version of es extended. Currently only supporting 1.1 and 1.2
Config.Locale = 'en'
Config.allowedJob = 'police'
Config.timer = 15 --Default: 15 | Number of minutes for the countdown of the cooldown
Config.resyncTime = 5 -- Default: 5 | Number in seconds to resync the priority status server-wide


Config.discordLogging = true --Default false, set to true if you want discord logging
Config.discord_webhook = 'https://discord.com/api/webhooks/824870834992447488/iSAkM-0yYPf1s8U5sziAAJWV1rby0A9PbhEs-V2VH5MehXtzfuCpVa32SD-VX6tAPaXO' --Your webhook here
Config.discord_footer = 'Footer goes here'
Config.discord_title = '**Priority Status Logger**'
Config.discord_image = 'https://emoji.gg/assets/emoji/3050-sus.png' --Image appearing at the footer of the discord embed
Config.discord_color = 3093151 --Get other colors in Decimal Format from https://www.mathsisfun.com/hexadecimal-decimal-colors.html