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


--Debugs polyzones and shows green boxes
Config.DebugPoly = false



--Blip Settings
Config.Blips = {
    {title = 'Limeys Juice Bar', colour = 2, id = 77, coords = vector3(247.7, -1027.74, 29.14), scale = 0.7, useblip = true}, -- BLIP FOR LIMEYS JUICE BAR
}


Config.CoreSettings = {
    Job = {
        Name = 'limeys', -- name of job in core/shared/jobs.lua
    },
    EventNames = {
        BossMenu = 'qb-bossmenu:client:OpenMenu', -- NAME OF BOSS MENU EVENT TO OPEN MANAGEMENT MENU
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
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for mythic_notify
        --use 'boii' for boii_ui notify
    },    
    Menu = {
        Type = 'qb', -- menu script name, support for qb-menu, jixel-menu and ox_lib context menu
        --EDIT MENUS.LUA TO ADD YOUR OWN CUSTOM MENU SCRIPT 
        --use 'qb' for qb-menu
        --use 'jixel' for jixel-menu
        --use 'ox' for ox_lib context menu
        --use 'custom' for your own custom menu
    },
    Inventory = { 
        Type = 'qb', -- support for qb-inventory and ox_inventory
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Shop = {
        Type = 'qb', -- support for qb-inventory shops, jim-shops and ox_inventory shops
        --use 'qb' for qb-shops 
        --use 'jim' for jim-shop
        --use 'ox' if using ox_inventory
    },
}



Config.InteractionLocations = {
    Job = {
        Duty = {
            Location = vector3(252.79, -1018.61, 29.5), Height = 0.3, Width = 0.3, Heading = 45.24, MinZ = 29.45, MaxZ = 29.5, Icon = 'fa-solid fa-clipboard-user', Label = "Toggle Duty",
            Size = vec3(0.3,0.3,0.2), -- SIZE OF BOXZONE FOR OX_TARGET
        },
        BossMenu = {
            Location = vector3(253.2, -1022.84, 29.5), Height = 0.3, Width = 0.3, Heading = 230.57, MinZ = 29.45, MaxZ = 29.55, Icon = 'fa-solid fa-users', Label = "Open Management Menu",
            Size = vec3(0.3,0.3,0.2), -- SIZE OF BOXZONE FOR OX_TARGET
        },
    },
    Payment = {
        Location = vector3(253.48, -1022.42, 29.5), Height = 0.6, Width = 0.6, Heading = 249.97, MinZ = 29.45, MaxZ = 29.65, CashSymbol = '£', Icon = 'fa-solid fa-cash-register', Label = "Charge Customer",
        Size = vec3(0.5,0.5,0.5), -- SIZE OF BOXZONE FOR OX_TARGET
    },
    CollectionTray = {
        Location = vector3(254.07, -1020.83, 29.5), Height = 0.8, Width = 0.8, Heading = 249.99, MinZ = 29.45, MaxZ = 29.55, Icon = 'fa-solid fa-box-archive', Label = "Open Collection Tray",
        Size = vec3(0.8,0.8,0.2), -- SIZE OF BOXZONE FOR OX_TARGET
        StashSize = 1000000, -- STASH SIZE -- only relevant for qb-inventory - ox users change values in stashes.lua 
        StashSlots = 5, -- STASH SLOTS -- only relevant for qb-inventory - ox users change values in stashes.lua
        
    },
    SmoothieMachine = {
        Location = vector3(251.36, -1022.93, 29.5), Height = 0.5, Width = 0.5, Heading = 161.19, MinZ = 29.45, MaxZ = 30.25, Icon = 'fa-solid fa-blender', Label = "Prepare Smoothies",
        Size = vec3(0.5,0.5,1.5), -- SIZE OF BOXZONE FOR OX_TARGET
    },
    HotDrinksMachine = {
        Location = vector3(251.98, -1023.12, 29.7), Height = 0.7, Width = 0.7, Heading = 161.19, MinZ = 29.45, MaxZ = 30, Icon = 'fa-solid fa-mug-hot', Label = "Prepare Hot Drinks",
        Size = vec3(0.7,0.7,0.5), -- SIZE OF BOXZONE FOR OX_TARGET
    },
    Storage = {
        Fridge = {
            Location = vector3(252.42, -1019.23, 29), Height = 2.0, Width = 1.0, Heading = 71.47, MinZ = 28.5, MaxZ = 29.40, Icon = 'fa-solid fa-box-archive', Label = "Open Storage Fridge",
            Size = vec3(2.0,1.0,0.5), -- SIZE OF BOXZONE FOR OX_TARGET
            StashSize = 10000000, -- STASH SIZE -- only relevant for qb-inventory - ox users change values in stashes.lua
            StashSlots = 64, -- STASH SLOTS -- only relevant for qb-inventory - ox users change values in stashes.lua
        },
    },
    Ingredients = {
        Location = vector3(252.99, -1023.53, 29.5), Height = 0.4, Width = 0.6, Heading = 248.99, MinZ = 29.45, MaxZ = 29.7, Icon = 'fa-solid fa-box-archive', Label = "Open Ingredients Tray",
        Size = vec3(0.4,0.6,0.4), -- SIZE OF BOXZONE FOR OX_TARGET
        Items = { -- this is only relevant if using qb-inventory - ox users change item names and prices in shops.lua
            label = "Ingredients Tray", 
            slots = 11,
            items = {
                [1] = {name = "icecubes", price = 0, amount = 100000, info = {}, type = "item", slot = 1,},
                [2] = {name = "fruitjuice", price = 0, amount = 100000, info = {}, type = "item", slot = 2,},
                [3] = {name = "mango", price = 0, amount = 100000, info = {}, type = "item", slot = 3,},
                [4] = {name = "peach", price = 0, amount = 100000, info = {}, type = "item", slot = 4,},
                [5] = {name = "lychee", price = 0, amount = 100000, info = {}, type = "item", slot = 5,},
                [6] = {name = "pineapple", price = 0, amount = 100000, info = {}, type = "item", slot = 6,},
                [7] = {name = "coconut", price = 0, amount = 100000, info = {}, type = "item", slot = 7,},
                [8] = {name = "strawberry", price = 0, amount = 100000, info = {}, type = "item", slot = 8,},
                [9] = {name = "passionfruit", price = 0, amount = 100000, info = {}, type = "item", slot = 9,},
                [10] = {name = "lemon", price = 0, amount = 100000, info = {}, type = "item", slot = 10,},
                [11] = {name = "almonds", price = 0, amount = 100000, info = {}, type = "item", slot = 11,},
            },
        },
    },
    SnackShelf = {
        Location = vector3(254.24, -1016.8, 29.4), Height = 0.8, Width = 0.8, Heading = 338.82, MinZ = 28.75, MaxZ = 30.5, Icon = 'fa-solid fa-box-archive', Label = "Open Snack Shelf",
        Size = vec3(0.8,0.8,1.5), -- SIZE OF BOXZONE FOR OX_TARGET
        Items = { -- this is only relevant if using qb-inventory - ox users change item names and prices in shops.lua
            label = "Snack Shelf", 
            slots = 5,
            items = {
                [1] = {name = "chocolatedoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 1,},
                [2] = {name = "jamdoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 2,},
                [3] = {name = "custarddoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 3,},
                [4] = {name = "yumyum", price = 10, amount = 100000, info = {}, type = "item", slot = 4,},
                [5] = {name = "icedbun", price = 10, amount = 100000, info = {}, type = "item", slot = 5,},
            },
        },
    },
}