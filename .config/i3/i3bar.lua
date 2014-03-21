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

function json_wrap(full_text,color,sep,bw) -- Because typing out the whole JSON every time gets old ...
	return '{"full_text":"'..full_text..'","color":"'..color..'","separator":'..sep..',"separator_block_width":'..bw..'}'
end

function conky_init()
	conky_parse("${wireless_bitrate wlan0}${cpu cpu0}${memperc}${mpd_title}${mpd_artist}${mpd_status}${mpd_name}")
	conky_parse("${if_up eth0}${endif}${if_up wlan0}${endif}")
	xdg_runtime_dir = os.getenv("XDG_RUNTIME_DIR")
end

function conky_mpd()
	mpd_status	= conky_parse("${mpd_status}")
	mpd_artist	= conky_parse("${mpd_artist}")
	mpd_title	= conky_parse("${mpd_title}")
	mpd_name	= conky_parse("${mpd_name}")

	if mpd_name ~= "" then
		mpd_artist = mpd_name..": "
	else
		mpd_artist = mpd_artist.." - "
	end

	mpd_songinfo = string.gsub(mpd_artist..mpd_title,'\\','\\\\')
	mpd_songinfo = string.gsub(mpd_songinfo,'"','\\"')

	if mpd_status == "Playing" then
		return json_wrap("M ",green,0,0)..","..json_wrap(mpd_songinfo,bgrey,0,0)
	elseif mpd_status == "Paused" then
		return json_wrap("M ",yellow,0,0)..","..json_wrap(mpd_songinfo,bgrey,0,0)
	elseif mpd_status == "MPD not responding" then
		return json_wrap("M",bgrey,0,0)
	else
		return json_wrap("M ",red,0,0) ..","..json_wrap(mpd_songinfo,bgrey,0,0)
	end
end

function conky_net()
	eth_status = conky_parse("${if_up eth0}E${endif}")
	wifi_status = conky_parse("${if_up wlan0}W${endif}")
	wifi_bitrate = tonumber(string.sub(conky_parse("${wireless_bitrate wlan0}"),1,-5))

	if eth_status == "E" then
		return json_wrap("E",green,0,0)
	elseif wifi_status == "W" then
		return json_wrap("W",gradient(red,yellow,green,0,54,wifi_bitrate),0,0)
	else
		return json_wrap("N",bgrey,0,0)
	end
end

function conky_cpu()
	local cpu_usage = tonumber(conky_parse("${cpu cpu0}"))
	return json_wrap("C",gyr(cpu_usage),0,0)
end

function conky_ram()
	local ram_usage = tonumber(conky_parse("${memperc}"))
	if ram_usage >= 85 then
		local f = io.open(xdg_runtime_dir..'lowmem-is-working','r')
		if f == nil then
			os.execute("lowmem-warning-kill "..ram_usage)
		end
		f:close()
		return json_wrap("!",gyr(ram_usage),0,0)
	else
		return json_wrap("R",gyr(ram_usage),0,0)
	end
end

function conky_pvu()
	-- reads a file generated by volume keys.  Better than calling ponymix ...
    local f = io.open(xdg_runtime_dir..'/pulse/pvu','r')
	local pvu_vol = tonumber(f:read("*all"))
	f:close()

	if (pvu_vol == 0) or (pvu_vol == nil) then
		return json_wrap("V",bgrey,0,0)
	else
		return json_wrap("V",gyr(pvu_vol),0,0)
	end
end
