-- NE SURTOUT PAS TOUCHER CE FICHIER !!!

if SERVER then

	include("sh_conf_hud.lua")
	include("hud/cl_hud_client.lua")
	
	
	AddCSLuaFile("sh_conf_hud.lua")
	AddCSLuaFile("hud/cl_hud_client.lua")
	
	for _,v in pairs(file.Find("materials/easyhud/*", "GAME")) do
		resource.AddSingleFile("materials/easyhud/"..v)
	end

	if easyhud.consolesmessages then
		print("\nEasyHUD est en chargement... \n")
		
		print("EasyHUD est chargé !\n")
	end

else	
	
	AddCSLuaFile("sh_conf_hud.lua")
	AddCSLuaFile("hud/cl_hud_client.lua")

	for _,v in pairs(file.Find("materials/easyhud/*", "GAME")) do
		resource.AddSingleFile("materials/easyhud/"..v)
	end

	include("sh_conf_hud.lua")
	include("hud/cl_hud_client.lua")
end