-- This is a lua script to be loaded via conky
grey = "#2E3436"
bgrey = "#555753"
red = "#CC0000"
bred = "#EF2929"
green = "#4E9A06"
bgreen = "#8AE234"
yellow = "#C4A000"
byellow = "#FCE94F"
bwhite = "#FFFFFF"

function gradient(bot_color, mid_color, top_color, min, max, value)
	local function color2dec(c)
		return tonumber(c:sub(2,3),16), tonumber(c:sub(4,5),16), tonumber(c:sub(6,7),16)
	end

	local factor = 0
	if (value >= max) then
		factor = 1
	elseif (value > min) then
		factor = (value - min) / (max - min)
	end
	
	local bot_red, bot_green, bot_blue = color2dec(bot_color)
	local mid_red, mid_green, mid_blue = color2dec(mid_color)
	local top_red, top_green, top_blue = color2dec(top_color)

	if (factor <= 0.5) then
		factor		= factor * 2
		bot_red		= bot_red + (factor * (mid_red - bot_red))
		bot_green	= bot_green + (factor * (mid_green - bot_green))
		bot_blue	= bot_blue + (factor * (mid_blue - bot_blue))
	elseif (factor > 0.5) then
		factor 		= (factor - 0.5) * 2
		bot_red		= mid_red + (factor * (top_red - mid_red))
		bot_green	= mid_green + (factor * (top_green - mid_green))
		bot_blue	= mid_blue + (factor * (top_blue - mid_blue))
	end
	-- dec2color
	return string.format("#%02x%02x%02x", bot_red, bot_green, bot_blue)
end

function gyr(value) -- Since the main gradient is Gr > Y > Red, let's make an alias ...
	return gradient(green,yellow,red,0,100,value)
end

function conky_init()
	conky_parse("${wireless_bitrate wlan0}${cpu cpu0}${memperc}${mpd_title}${mpd_artist}${mpd_status}")
end

function conky_mpd()
	mpd_title = conky_parse("${mpd_title}")
	mpd_artist = conky_parse("${mpd_artist}")
	mpd_status = conky_parse("${mpd_status}")
	if mpd_status == "Playing" then
		return '{"full_text":"M ","color":"'..green..'"},{"full_text":"'..mpd_artist..' - '..mpd_title..'"}'
	elseif mpd_status == "Paused" then
		return '{"full_text":"M ","color":"'..yellow..'"},{"full_text":"'..mpd_artist..' - '..mpd_title..'"}'
	else
		return '{"full_text":"M","color":"'..red..'"}'	
	end
end

function conky_net()
	local wifi_bitrate = tonumber(string.sub(conky_parse("${wireless_bitrate wlan0}"), 1, -5))
	return '{"full_text":"W","color":"'..gyr(wifi_bitrate/54)..'"}'
end

function conky_cpu()
	local cpu_usage = tonumber(conky_parse("${cpu cpu0}"))
	return '{"full_text":"C","color":"'..gyr(cpu_usage)..'"}'
end

function conky_ram()
	local ram_usage = tonumber(conky_parse("${memperc}"))
	return '{"full_text":"R","color":"'..gyr(ram_usage)..'"}'
end

function conky_pvu()
	-- reads a file generated by volume keys.  Better than calling ponymix ...
    local f = io.open('/tmp/pvu.zekesulastin','r')
	local pvu_vol = tonumber(f:read("*all"))
	f:close()
	if (pvu_vol == 0) then
		return'{"full_text":"V","color":"'..bgrey..'"}'
	else
		return'{"full_text":"V","color":"'..gyr(pvu_vol)..'"}'
	end
end
