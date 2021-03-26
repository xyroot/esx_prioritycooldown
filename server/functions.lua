function sendWebhook(message)
    local send = {
        {
            ["color"] = Config.discord_color,
            ["title"] = Config.discord_title,
            ["description"] = message,
            ["footer"] = {
            	["text"] = Config.discord_footer,
				["icon_url"] = Config.discord_image
            },
        }
    }
    PerformHttpRequest(Config.discord_webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.discord_name, embeds = send, avatar_url = Config.discord_image}), { ['Content-Type'] = 'application/json' })
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }
  
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
  
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end
  
    return identifiers
  end