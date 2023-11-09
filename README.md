
-A LIMEYS JUICE BAR JOB FOR QB-CORE
-CREATE 9 DIFFERENT SMOOTHIES
-CREATE 3 HOT DRINKS
-SNACK SHELF WITH SWEET TREATS FOR PLAYERS TO PURCHASE
-TILL SALES GO TO SOCIETY FUND
-SUPPORT FOR QB-MENU, JIXEL-MENU, BOII_UI MENU, OX_LIB CONTEXT MENU
-SUPPORT FOR QB-NOTIFY, OKOKNOTIFY, MYTHIC_NOTIFY, BOII_UI NOTIFY
-SUPPORT FOR QB-TARGET AND OX_TARGET
-SUPPORT FOR QB-INVENTORY AND OX_INVENTORY




SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8



## OX INVENTORY USERS - STORAGE FRIDGE, INGREDIENTS FRIDGE, SNACK SHELF & COLLECTION TRAY INFORMATION

- If you are using ox_inventory you must add this snippet below to ox_inventory/data/shops & stashes.lua for the ingredients and snack shelf stores to work correctly. 

``

--SHOPS.LUA--

    LimeysIngredients = {
		name = 'Limeys Ingredients Store',
		groups = {
			['limeys'] = 0
		},
		inventory = {
			{ name = 'icecubes', price = 0 },
			{ name = 'fruitjuice', price = 0 },
			{ name = 'mango', price = 0 },
			{ name = 'peach', price = 0 },
			{ name = 'lychee', price = 0 },
			{ name = 'pineapple', price = 0 },
			{ name = 'coconut', price = 0 },
			{ name = 'strawberry', price = 0 },
			{ name = 'passionfruit', price = 0 },
			{ name = 'lemon', price = 0 },
			{ name = 'almonds', price = 0 },
		},
		locations = {
			vec3(252.99, -1023.53, 29.5)
		}, 
		targets = {
			{ loc = vec3(252.99, -1023.53, 29.5), length = 0.4, width = 0.6, heading = 248.99, minZ = 29.45, maxZ = 29.7, distance = 3 }
		}
	},

	LimeysSnacks = {
		name = 'Limeys Snack Shelf',
		inventory = {
			{ name = 'chocolatedoughnut', price = 10 },
			{ name = 'jamdoughnut', price = 10 },
			{ name = 'custarddoughnut', price = 10 },
			{ name = 'yumyum', price = 10 },
			{ name = 'icedbun', price = 10 },
		},
		locations = {
			vec3(254.24, -1016.8, 29.4)
		}, 
		targets = {
			{ loc = vec3(254.24, -1016.8, 29.4), length = 0.8, width = 0.8, heading = 338.82, minZ = 28.75, maxZ = 30.5, distance = 3 }
		}
	},



--STASHES.LUA--

    { -- limeys juice bar storage fridge
		coords = vec3(252.42, -1019.23, 29),
		target = {
			loc = vec3(252.42, -1019.23, 29),
			length = 2.0,
			width = 1.0,
			heading = 71.47,
			minZ = 28.5,
			maxZ = 29.40,
			label = 'Open Storage Fridge'
		},
		name = 'limeysstoragefridge',
		label = 'Limeys Storage Fridge',
		owner = true,
		slots = 64,
		weight = 10000000,
		groups = {['limeys'] = 0}
	},

	{ -- limeys juice bar collection tray
		coords = vec3(254.07, -1020.83, 29.5),
		target = {
			loc = vec3(254.07, -1020.83, 29.5),
			length = 0.8,
			width = 0.8,
			heading = 249.99,
			minZ = 29.45,
			maxZ = 29.55,
			label = 'Open Collection Tray'
		},
		name = 'limeyscollectiontray',
		label = 'Limeys Collection Tray',
		owner = false,
		slots = 5,
		weight = 1000000,
	},

``





-----Dependencies------

qb-core: https://github.com/qbcore-framework/qb-core

qb-target: https://github.com/qbcore-framework/qb-target

qb-menu: https://github.com/qbcore-framework/qb-menu

qb-input: https://github.com/qbcore-framework/qb-input

progressbar: https://github.com/qbcore-framework/progressbar

ox_lib: https://github.com/overextended/ox_lib

Limeys MLO: https://www.gta5-mods.com/maps/mlo-limeys-juice-bar-fivem-add-on-sp   
MAKE SURE TO INSTALL THE FIVEM VERSION NOT THE SINGLEPLAYER VERSION!









------INSTALLATION------





MAKE SURE TO INSTALL ALL NECCESSARY DEPENDENCIES AND ENSURE THEY START BEFORE LUSTY94_LIMEYS IN YOUR SERVER.CFG FILE

	
Insert images inside [images] folder into inventory/html/images - ox_inventory is web/images


Insert items into qb-core/shared/items.lua

Adjust weights of items to suit your server



```

	['mango'] 					= {['name'] = 'mango', 			 	  	  		['label'] = 'Fresh Mango', 				    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'mango.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Mango'},
	['peach'] 					= {['name'] = 'peach', 			 	  	  		['label'] = 'Fresh Peach', 				    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'peach.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Peach'},
	['lychee'] 					= {['name'] = 'lychee', 			 	  	  	['label'] = 'Fresh Lychee', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'lychee.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Lychee'},
	['pineapple'] 				= {['name'] = 'pineapple', 			 	  	  	['label'] = 'Fresh Pineapple', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pineapple.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Pineapple'},
	['coconut'] 				= {['name'] = 'coconut', 			 	  	  	['label'] = 'Fresh Coconut', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'coconut.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Coconut'},
	['strawberry'] 				= {['name'] = 'strawberry', 			 	  	['label'] = 'Fresh Strawberry', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'strawberry.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Strawberry'},
	['passionfruit'] 			= {['name'] = 'passionfruit', 			 	  	['label'] = 'Fresh Passion Fruit', 			['weight'] = 200, 		['type'] = 'item', 					['image'] = 'passionfruit.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Passion Fruit'},
	['lemon'] 					= {['name'] = 'lemon', 			 	  	  		['label'] = 'Fresh Lemon', 				    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'lemon.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Lemon'},
	['almonds'] 				= {['name'] = 'almonds', 			 	  	  	['label'] = 'Fresh Almonds', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'almonds.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Almonds'},
	
    
    ['tea'] 					= {['name'] = 'tea', 			 	  	  	    ['label'] = 'Cup of Tea', 				    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cupoftea.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Cup of Tea'},
    ['coffee'] 					= {['name'] = 'coffee', 			 	  	  	['label'] = 'Cup of Coffee', 				['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cupofcoffee.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Cup of Coffee'},
    ['hotchocolate'] 			= {['name'] = 'hotchocolate', 			 	  	['label'] = 'Cup of Hot Chocolate', 		['weight'] = 200, 		['type'] = 'item', 					['image'] = 'cupofhotchocolate.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Cup of Hot Chocolate'},
    
    ['smoothiecup'] 			= {['name'] = 'smoothiecup', 			 	  	['label'] = 'Smoothie Cup', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'smoothiecup.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Smoothie Cup'},
    ['coffeecup'] 			    = {['name'] = 'coffeecup', 			 	  	    ['label'] = 'Coffee Cup', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'coffeecup.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Coffee Cup'},
    ['icecubes'] 			    = {['name'] = 'icecubes', 			 	  	    ['label'] = 'Ice Cubes', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'icecubes.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Frozen Ice Cubes'},
    ['fruitjuice'] 			    = {['name'] = 'fruitjuice', 			 	  	['label'] = 'Fruit Juice', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'fruitjuice.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Fruit Juice'},
    
    
    ['chocolatedoughnut'] 		= {['name'] = 'chocolatedoughnut', 			 	['label'] = 'Chocolate Doughnut', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'chocolatedougnut.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Chocolate Dougnut'},
    ['jamdoughnut'] 			= {['name'] = 'jamdoughnut', 			 	  	['label'] = 'Jam Doughnut', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'jamdougnut.png', 			    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Jam Dougnut'},
    ['custarddoughnut'] 		= {['name'] = 'custarddoughnut', 			 	['label'] = 'Custard Doughnut', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'custarddougnut.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Custard Dougnut'},
    ['yumyum'] 			        = {['name'] = 'yumyum', 			 	  	    ['label'] = 'Iced Yum-Yum', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'yumyum.png', 			        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Iced Yum-Yum'},
    ['icedbun'] 			    = {['name'] = 'icedbun', 			 	  	    ['label'] = 'Iced Bun', 		            ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'icedbun.png', 			        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Iced Bun'},
    
    ['mangosmoothie'] 			= {['name'] = 'mangosmoothie', 			 	  	['label'] = 'Mango Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'mangosmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Mango Smoothie'},
    ['peachsmoothie'] 			= {['name'] = 'peachsmoothie', 			 	  	['label'] = 'Peach Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'peachsmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Peach Smoothie'},
    ['lycheesmoothie'] 			= {['name'] = 'lycheesmoothie', 			 	['label'] = 'Lychee Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'lycheesmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Lychee Smoothie'},
    ['pineapplesmoothie'] 		= {['name'] = 'pineapplesmoothie', 			 	['label'] = 'Pineapple Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'pineapplesmoothie.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Pineapple Smoothie'},
    ['coconutsmoothie'] 		= {['name'] = 'coconutsmoothie', 			 	['label'] = 'Coconut Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'coconutsmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Coconut Smoothie'},
    ['strawberrysmoothie'] 		= {['name'] = 'strawberrysmoothie', 			['label'] = 'Strawberry Smoothie', 		    ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'strawberrysmoothie.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Strawberry Smoothie'},
    ['passionfruitsmoothie'] 	= {['name'] = 'passionfruitsmoothie', 			['label'] = 'Passion Fruit Smoothie', 		['weight'] = 200, 		['type'] = 'item', 					['image'] = 'passionfruitsmoothie.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Passion Fruit Smoothie'},
    ['lemonsmoothie'] 			= {['name'] = 'lemonsmoothie', 			 	  	['label'] = 'Lemon Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'lemonsmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Lemon Smoothie'},
    ['almondsmoothie'] 			= {['name'] = 'almondsmoothie', 			 	['label'] = 'Almond Smoothie', 		        ['weight'] = 200, 		['type'] = 'item', 					['image'] = 'almondsmoothie.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'Fresh Almond Smoothie'},


```

--Insert job into core/shared/jobs.lua
--Adjust payment and titles to suit your server

```
['limeys'] = {
		label = 'Limeys Juice Bar',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 50
            },
            ['1'] = {
                name = 'Juice Maker',
                payment = 50
            },
            ['2'] = {
                name = 'Floor Manager',
                payment = 50
            },
            ['3'] = {
                name = 'GENERAL MANAGER',
                payment = 50
            },
            ['4'] = {
                name = 'OWNER',
                isboss = true,
                payment = 50
            },
        },
	},

```

--Insert into qb-smallresources config.lua or your own consumables script to eat and drink items created
--Edit amounts of hunger/thirst replenished to suit your server

```

	Under Config.ConsumbalesEat Place The Following

	["chocolatedoughnut"] = math.random(35, 54),
    ["jamdoughnut"] = math.random(35, 54),
    ["custarddoughnut"] = math.random(35, 54),
    ["yumyum"] = math.random(35, 54),
    ["icedbun"] = math.random(35, 54),
	
	

	Under Config.ConsumablesDrink Place The Following

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

```

	
	
