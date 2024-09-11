Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.



Config.DebugPoly = false --Debugs polyzones and shows green boxes
Config.DevMode = false --cancels job duty check


--Blip Settings
Config.Blips = {
    {title = 'Limeys Juice Bar', colour = 2, id = 77, coords = vector3(247.7, -1027.74, 29.14), scale = 0.7, useblip = true}, -- BLIP FOR LIMEYS JUICE BAR
}


Config.CoreSettings = {
    Job = {
        Name = 'limeys', -- name of job in core/shared/jobs.lua
    },
    Target = {
        Type = 'qb', -- target script name support for qb-target and ox_target 
        --EDIT TARGETS.LUA TO ADD YOUR OWN CUSTOM TARGET SCRIPT        
        --use 'qb' for qb-target
        --use 'ox' for ox_target
        --use 'custom' for custom target 
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify and boii_ui notify
        --use 'qb' for defa`1ult qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for mythic_notify
        --use 'boii' for boii_ui notify
    },    
    Inventory = { 
        Type = 'qb', -- support for qb-inventory and ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Timers = {
        PrepareDrinks = 5000, -- time to prepare hot drinks and smoothies
        Eat = 5000, -- time to consume food
        Drink = 5000, -- time to consume drinks
    },
}


Config.InteractionLocations = {
    JobAreas = {
        { Name = "limeysduty",            Location = vector3(252.79, -1018.61, 29.5),    Width = 0.3,    Height = 0.3,       Heading = 45.24,  MinZ = 29.45,    MaxZ = 29.5,     Icon = 'fa-solid fa-clipboard-user',   Label = 'Toggle Duty',                  Job = 'limeys',      Size = vec3(0.3,0.3,0.2),    Event = 'lusty94_limeys:client:ToggleDuty',},
        { Name = "limeysbossmenu",        Location = vector3(253.2, -1022.84, 29.5),     Width = 0.3,    Height = 0.3,       Heading = 230.57, MinZ = 29.45,    MaxZ = 29.55,    Icon = 'fa-solid fa-users',            Label = 'Open Management Menu',         Job = 'limeys',      Size = vec3(0.5,0.5,0.2),    Event = 'qb-bossmenu:client:OpenMenu',},
        { Name = "limeyspayment",         Location = vector3(253.48, -1022.42, 29.5),    Width = 0.6,    Height = 0.6,       Heading = 249.97, MinZ = 29.45,    MaxZ = 29.65,    Icon = 'fa-solid fa-money-bill',       Label = 'Charge Customer',              Job = 'limeys',      Size = vec3(0.6,0.6,0.2),    Event = 'lusty94_limeys:bill',},
        { Name = "limeysmoothies",        Location = vector3(251.36, -1022.93, 29.7),    Width = 0.5,    Height = 0.5,       Heading = 161.19, MinZ = 29.45,    MaxZ = 30.25,    Icon = 'fa-solid fa-blender',          Label = 'Prepare Smoothies',            Job = 'limeys',      Size = vec3(0.5,0.5,0.5),    Event = 'lusty94_limeys:client:SmoothieMenu',},
        { Name = "limeyhotdrinks",        Location = vector3(251.98, -1023.12, 29.7),    Width = 0.7,    Height = 0.7,       Heading = 161.19, MinZ = 29.45,    MaxZ = 30.25,    Icon = 'fa-solid fa-mug-hot',          Label = 'Prepare Hot Drinks',           Job = 'limeys',      Size = vec3(0.5,0.5,0.5),    Event = 'lusty94_limeys:client:HotDrinksMenu',},
        { Name = "limeysnakcs",           Location = vector3(254.24, -1016.8, 29.4),     Width = 0.8,    Height = 0.8,       Heading = 338.82, MinZ = 28.75,    MaxZ = 30.5,     Icon = 'fa-solid fa-mug-hot',          Label = 'Open Snack Shelf',             Job = nil,           Size = vec3(0.8,0.8,1.5),    Event = 'lusty94_limeys:client:SnackShelf',},
        { Name = "limeyscollectiontray",  Location = vector3(254.07, -1020.83, 29.5),    Width = 0.8,    Height = 0.8,       Heading = 249.99, MinZ = 29.45,    MaxZ = 29.55,    Icon = 'fa-solid fa-box-archive',      Label = 'Open Collection Tray',         Job = nil,           Size = vec3(0.8,0.8,0.2),    Event = 'lusty94_limeys:client:OpenCollectionTray',},
        { Name = "limeysstoragefridge",   Location = vector3(252.42, -1019.23, 29),      Width = 1.0,    Height = 2.0,       Heading = 71.47,  MinZ = 28.5,     MaxZ = 29.40,    Icon = 'fa-solid fa-box-archive',      Label = 'Open Storage Fridge',          Job = 'limeys',      Size = vec3(2.0,1.0,0.90),   Event = 'lusty94_limeys:client:OpenStorageFridge',},
        { Name = "limeysingredients",     Location = vector3(252.99, -1023.53, 29.5),    Width = 0.6,    Height = 0.4,       Heading = 248.99, MinZ = 29.45,    MaxZ = 29.7,     Icon = 'fa-solid fa-box-archive',      Label = 'Open Ingredients Tray',        Job = 'limeys',      Size = vec3(0.4,0.6,0.4),    Event = 'lusty94_limeys:client:IngredientsTray',},
    },
}


Config.Consumables = { -- edit math.random() values to change amount of thirst or hunger replenishment
    Food = {
        ["chocolatedoughnut"] = math.random(35, 54),
        ["jamdoughnut"] = math.random(35, 54),
        ["custarddoughnut"] = math.random(35, 54),
        ["yumyum"] = math.random(35, 54),
        ["icedbun"] = math.random(35, 54),
    },
    Drink = {
        ["mangosmoothie"] = math.random(40, 50),
        ["peachsmoothie"] = math.random(40, 50),
        ["lycheesmoothie"] = math.random(40, 50),
        ["pineapplesmoothie"] = math.random(40, 50),
        ["coconutsmoothie"] = math.random(40, 50),
        ["strawberrysmoothie"] = math.random(40, 50),
        ["passionfruitsmoothie"] = math.random(40, 50),
        ["lemonsmoothie"] = math.random(40, 50),
        ["almondsmoothie"] = math.random(40, 50),
        ["tea"] = math.random(40, 50),
        ["coffee"] = math.random(40, 50),
        ["hotchocolate"] = math.random(40, 50),
    },
}


Config.Animations = {
    PrepareIngredients = {
        AnimDict = 'amb@prop_human_parking_meter@female@base',
        Anim = 'base_female',
        Flags = 41,
    },
    Eat = {
        AnimDict = "mp_player_inteat@burger",
        Anim = "mp_player_int_eat_burger", 
        Flags = 49,
        Prop = 'prop_cs_burger_01',
        Bone = 60309,
        Pos = vec3(0.0, 0.0, 0.0),
        Rot = vec3(0.0, 0.0, 0.0),
    },
    Drink = {
        AnimDict = "amb@world_human_drinking@coffee@male@idle_a",
        Anim = "idle_c", 
        Flags = 49,
        Prop = 'p_ing_coffeecup_02',
        Bone = 28422,
        Pos = vec3(0.01, -0.01, 0.0),
        Rot = vec3(0.0, 0.0, 0.0),
    },
}


Config.Language = {
    ProgressBar = {
        PrepareSmoothie = 'Preparing smoothie',
        PrepareHotDrink = 'Preparing hot drink',
        Eat = 'Taking a bite',
        Drink = 'Taking a sip',
    },
    Notifications = {
        Duty = 'You must be clocked on duty to proceed',
        Busy = 'You are already doing something!',
        Cancelled = 'Action cancelled!',
        Failed = 'Action failed!',
        CantCarry = 'You cant carry anymore!',
        MissingItems = 'You are missing items, check the requirements!',
    },
}