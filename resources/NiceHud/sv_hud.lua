----- Made by Tovermannetje For the People -> Tover's Services https://discord.me/tover

TriggerEvent('es:addCommand', 'togglehud', function(source, args)
	if not args then 
		TriggerClientEvent('chat:addMessage', -1, { args = { "^1[SYNTAX]", "/togglehud [on/off]" }, color = 0,0,0 })
	else
	local a = tostring(args[1])
		if a == "off" then
			TriggerClientEvent('tover_hud:toggle', source, false)
		elseif a == "on" then
			TriggerClientEvent('tover_hud:toggle', source, true)
		else
			TriggerClientEvent('chat:addMessage', -1, { args = { "^1[SYNTAX]", "/togglehud [on/off]" }, color = 0,0,0 })
		end
	end
end, {help = "Toggles the hud on and off"})
