AddCSLuaFile()
include("sh_conf_hud.lua")
local licenseicon = Material(easyhud.icon1) -- Îcone de la license d'arme
local wantedicon = Material(easyhud.icon2) -- Îcone pour la recherche
 
if CLIENT then
    surface.CreateFont("Hud30", {
        font = "Arial",
        extended = false,
        size = 32,
        weight = 600,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false
    })
 
    surface.CreateFont("Hud24", {
        font = "Arial",
        extended = false,
        size = 26,
        weight = 600,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false
    })
 
    surface.CreateFont("Hud16", {
        font = "Arial",
        extended = false,
        size = 22,
        weight = 620,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false
    })
end
 
local space = " "
 
hook.Add("HUDPaint", "HUD_LP_PAINT", function(ply)
    -- ne pas toucher aux variables :)
    presnormal = false
    presnormalsansarmor = false
    presjustevie = false
    presfoodarmor = false
    presfood = false
    presarmor = false
    preshealtharmor = false
 
    if not easyhud.automove then
        presnormal = false
    end
 
    if easyhud.health then
        if easyhud.food then
            if easyhud.armor then
                presnormal = true
            else
                presnormalsansarmor = true
            end
        else
            if not easyhud.armor then
                presjustevie = true
            end
        end
    elseif easyhud.food then
        if easyhud.armor then
            presfoodarmor = true
        else
            presfood = true
        end
    elseif easyhud.armor then
        if not easyhud.health then
            presarmor = true
        end
    end
 
    if easyhud.armor then
        if easyhud.health then
            if not easyhud.food == true then
                preshealtharmor = true
            end
        end
    end
 
    local vie = LocalPlayer():Health()
 
    if vie < 0 then
        vie = 0
    elseif vie > 100 then
        vie = 100
    end
 
    local armure = LocalPlayer():Armor()
 
    if armure < 0 then
        armure = 0
    elseif armure > 100 then
        armure = 100
    end
 
    local nourriture = LocalPlayer():getDarkRPVar("Energy")
    local logo = easyhud.nameover
 
    local right = easyhud.suffixes
 
    if right then
        if presnormal == true then
            if easyhud.health then
                if easyhud.sufhealthstate then
                    draw.DrawText(easyhud.sufhealth, "Hud16", 290, ScrH() - 82, easyhud.colorhealthsuf)
                end
            end
 
            if easyhud.armor then
                if easyhud.sufarmorstate then
                    draw.DrawText(easyhud.sufarmor, "Hud16", 290, ScrH() - 58, easyhud.colorarmorsuf)
                end
            end
 
            if easyhud.food then
                if easyhud.suffoodstate then
                    draw.DrawText(easyhud.suffood, "Hud16", 290, ScrH() - 32, easyhud.colorfoodsuf)
                end
            end
        end
 
        if presnormalsansarmor == true then
            if easyhud.health then
                if easyhud.sufhealthstate then
                    draw.DrawText(easyhud.sufhealth, "Hud16", 290, ScrH() - 60, easyhud.colorhealthsuf)
                end
            end
 
            if easyhud.food then
                if easyhud.suffoodstate then
                    draw.DrawText(easyhud.suffood, "Hud16", 290, ScrH() - 32, easyhud.colorfoodsuf)
                end
            end
        end
 
        if presjustevie == true then
            if easyhud.health then
                if easyhud.sufhealthstate then
                    draw.DrawText(easyhud.sufhealth, "Hud16", 290, ScrH() - 38, easyhud.colorhealthsuf)
                end
            end
        end
 
        if preshealtharmor == true then
            if easyhud.health then
                if easyhud.sufhealthstate then
                    draw.DrawText(easyhud.sufhealth, "Hud16", 290, ScrH() - 64, easyhud.colorhealthsuf)
                end
            end
 
            if easyhud.armor then
                if easyhud.sufarmorstate then
                    draw.DrawText(easyhud.sufarmor, "Hud16", 290, ScrH() - 35, easyhud.colorarmorsuf)
                end
            end
        end
 
        if presfoodarmor == true then
            if easyhud.armor then
                if easyhud.sufarmorstate then
                    draw.DrawText(easyhud.sufarmor, "Hud16", 290, ScrH() - 58, easyhud.colorarmorsuf)
                end
            end
 
            if easyhud.food then
                if easyhud.suffoodstate then
                    draw.DrawText(easyhud.suffood, "Hud16", 290, ScrH() - 32, easyhud.colorfoodsuf)
                end
            end
        end
 
        if presfood == true then
            if easyhud.food then
                if easyhud.suffoodstate then
                    draw.DrawText(easyhud.suffood, "Hud16", 290, ScrH() - 38, easyhud.colorfoodsuf)
                end
            end
        end
 
        if presarmor == true then
            if easyhud.armor then
                if easyhud.sufarmorstate then
                    draw.DrawText(easyhud.sufarmor, "Hud16", 290, ScrH() - 38, easyhud.colorarmorsuf)
                end
            end
        end
    end
 
    if preshealtharmor == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .9, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 62, vie * 2.5, 15, easyhud.colorhealth)
        draw.RoundedBox(6, 23, ScrH() - 65, 259, 22, Color(0, 0, 0, 150))
        draw.RoundedBox(3, 27.7, ScrH() - 32, armure * 2.5, 15, easyhud.colorarmor)
        draw.RoundedBox(6, 23, ScrH() - 35, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presnormal == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .9, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27, ScrH() - 80, vie * 2.5, 15, easyhud.colorhealth)
        draw.RoundedBox(6, 23, ScrH() - 83, 259, 22, Color(0, 0, 0, 150))
        draw.RoundedBox(3, 27, ScrH() - 29, nourriture * 2.5, 15, easyhud.colorfood)
        draw.RoundedBox(6, 23, ScrH() - 32, 259, 22, Color(0, 0, 0, 150))
        draw.RoundedBox(3, 27, ScrH() - 56, armure * 2.5, 15, easyhud.colorarmor)
        draw.RoundedBox(6, 23, ScrH() - 59, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presnormalsansarmor == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .9, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 60, vie * 2.5, 15, easyhud.colorhealth)
        draw.RoundedBox(6, 23, ScrH() - 63, 259, 22, Color(0, 0, 0, 150))
        draw.RoundedBox(3, 27.7, ScrH() - 29, nourriture * 2.5, 15, easyhud.colorfood)
        draw.RoundedBox(6, 23, ScrH() - 32, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presjustevie == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .95, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 35, vie * 2.5, 15, easyhud.colorhealth)
        draw.RoundedBox(6, 23, ScrH() - 38, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presfoodarmor == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .9, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 29, nourriture * 2.5, 15, easyhud.colorfood)
        draw.RoundedBox(6, 23, ScrH() - 32, 259, 22, Color(0, 0, 0, 150))
        draw.RoundedBox(3, 27.7, ScrH() - 56, armure * 2.5, 15, easyhud.colorarmor)
        draw.RoundedBox(6, 23, ScrH() - 59, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presfood == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .95, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 35, nourriture * 2.5, 15, easyhud.colorfood)
        draw.RoundedBox(6, 23, ScrH() - 38, 259, 22, Color(0, 0, 0, 150))
    end
 
    if presarmor == true then
        if easyhud.name then
            draw.DrawText(logo, "Hud24", 150, ScrH() * .95, easyhud.logocolor, TEXT_ALIGN_CENTER)
        end
 
        draw.RoundedBox(3, 27.7, ScrH() - 35, armure * 2.5, 15, easyhud.colorarmor)
        draw.RoundedBox(6, 23, ScrH() - 38, 259, 22, Color(0, 0, 0, 150))
    end
 
    if easyhud.playername then
        local playerRpName = LocalPlayer():getDarkRPVar("rpname")
        draw.DrawText(playerRpName, "Hud24", ScrW() - string.len(playerRpName) + 8, ScrH() * .92, easyhud.playernamecolor, TEXT_ALIGN_RIGHT)
    end
 
    if easyhud.playerjob then
        local playerRpJob = LocalPlayer():getDarkRPVar("job")
        draw.DrawText(playerRpJob, "Hud24", ScrW() - 7, ScrH() * .946, easyhud.playerjobcolor, TEXT_ALIGN_RIGHT)
    end
 
    if easyhud.playermoney then
        local playerRpMoney = LocalPlayer():getDarkRPVar("money")
        local nbmon = string.len(playerRpMoney)
 
        if nbmon < 3 then
            nbmon = 6
        end
 
        if nbmon >= 13 then
            nbmon = nbmon + nbmon / 1.9
        end
 
        if easyhud.boxmoney then
            draw.RoundedBox(0, ScrW() - (130 + nbmon * 4.5), ScrH() * .97, (130 + nbmon * 4.5), 25, easyhud.boxcolor1)
            draw.RoundedBox(0, ScrW() - (128 + nbmon * 4.5), ScrH() * .9725, (125 + nbmon * 4.5), 22, easyhud.boxcolor2)
        end
 
        draw.DrawText(playerRpMoney .. space .. easyhud.currency, "Hud24", ScrW() - 6, ScrH() * .9725, easyhud.playermoneycolor, TEXT_ALIGN_RIGHT)
    end
 
    if easyhud.licensewepicon then
        if LocalPlayer():getDarkRPVar("HasGunlicense") then
            if CLIENT then
                surface.SetMaterial(licenseicon)
                surface.SetDrawColor(255, 255, 255)
                surface.DrawTexturedRect(ScrW() - 40, 735 + (ScrH() * 0.200), 35, 35)
            end
        end
    end
 
    if easyhud.wantedicon then
        if LocalPlayer():getDarkRPVar("wanted") then
            if CLIENT then
                surface.SetMaterial(wantedicon)
                surface.SetDrawColor(255, 255, 255)
                surface.DrawTexturedRect(ScrW() - 80, 735 + (ScrH() * 0.200), 35, 35)
            end
        end
    end
end)
 
-- Aucune modification ne doit être apportée. Ce n'est qu'une sécurité pour desactiver l'HUD de base
local HideElementsTable = {
    ["DarkRP_HUD"] = true,
    ["DarkRP_ArrestedHUD"] = false,
    ["DarkRP_EntityDisplay"] = false,
    ["DarkRP_ZombieInfo"] = true,
    ["DarkRP_LocalPlayerHUD"] = true,
    ["DarkRP_Hungermod"] = true,
    ["DarkRP_Agenda"] = true,
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudSuitPower"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true
}
 
local function HideElements(element)
    if HideElementsTable[element] then return false end
end
 
local function DisplayNotify(msg)
    local txt = msg:ReadString()
    GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong())
    surface.PlaySound("buttons/lightswitch2.wav")
    MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
end
 
usermessage.Hook("_Notify", DisplayNotify)
hook.Add("HUDShouldDraw", "HideElements", HideElements)