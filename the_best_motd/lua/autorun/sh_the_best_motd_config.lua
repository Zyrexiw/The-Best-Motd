ThebestMotdConfig = ThebestMotdConfig or {}
ThebestMotdConfig.lang = ThebestMotdConfig.lang or {}

resource.AddFile("resource/fonts/Bubbleboddy-FatTrial.ttf")

ThebestMotdConfig.avatarserver = Material("materials/img/lua.png", "smooth") 

ThebestMotdConfig.ColorTable = {
	["Background"] = Color(0, 0, 0, 700),
	["Buttons"] = Color(41, 128, 185),
}

ThebestMotdConfig.TitleServer = "Our Server" 

ThebestMotdConfig.language = "eng" 

ThebestMotdConfig.lang["eng"] = {
	["button_play"] = "Play",
	["button_settings"] = "Settings",
	["button_discord"] = "Discord",
	["button_disconnect"] = "Disconnect"
}

ThebestMotdConfig.lang["fr"] = {
	["button_play"] = "Jouer",
	["button_settings"] = "Options",
	["button_discord"] = "Discord",
	["button_disconnect"] = "Se deconnecter"
}


ThebestMotdConfig.buttons = 
{
	{
		name = ThebestMotdConfig.lang[ThebestMotdConfig.language]["button_play"],
		func = function()
			remove()
		end,
	},
	{
		name = ThebestMotdConfig.lang[ThebestMotdConfig.language]["button_settings"],
		func = function()
			RunConsoleCommand("gamemenucommand", "openoptionsdialog")
			timer.Simple( 0, function() RunConsoleCommand("gameui_activate") end )
		end,
	},
	{
		name = ThebestMotdConfig.lang[ThebestMotdConfig.language]["button_discord"],
		func = function()
			gui.OpenURL("https://discord.com/")
		end,		
	},
	{
		name = ThebestMotdConfig.lang[ThebestMotdConfig.language]["button_disconnect"],
		func = function()
			RunConsoleCommand("disconnect")
		end,
	},
}






