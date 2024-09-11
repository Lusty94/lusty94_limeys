## Lusty94_Limeys


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================



## Features

- Make various types of smoothies
- Make various types of hot drinks
- Billing system to charge customers
- Managemenu menu to hire and fire employees




## DEPENDENCIES

- [Limeys MLO](https://www.gta5-mods.com/maps/mlo-limeys-juice-bar-fivem-add-on-sp)
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/qbcore-framework/qb-target)
- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [ox_lib](https://github.com/overextended/ox_lib/releases/)






## INSTALLATION

- Add the ##ITEMS snippet below into your core/shared/items.lua file
- Add the ##JOB snippet below to your core/shared/jobs.lua
- Add all .png images inside [images] folder into your inventory/html/images folder - ox_inventory users place images inside inventory/web/images
- Add the snippet for consumables to qb-smallresources or another consumable script


## OX_INVENTORY
- Items list for ox_inventory is below
- This resource creates and registers shops and stashes for ox_inventory automatically
- if using ox_invnetory item names for shops etc are located in limeys_server.lua - edit prices or names there





## JOB
```

   	limeys = {
        label = 'Limeys Juice Bar',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Employee', payment = 50 },
            ['1'] = { name = 'Juice Maker', payment = 50 },
            ['2'] = { name = 'Floor Manager', payment = 50 },
            ['3'] = { name = 'GENERAL MANAGER', payment = 50 },
            ['4'] = {  name = 'OWNER', isboss = true, payment = 50 },
        },
    },

```



## CONSUMABLES

- This resource has an inbuilt consumalbes system
- To edit replenishment values edit the math.random() figures in Config.Consumables





## QB-CORE ITEMS

```


    --LIMEYS JUICE BAR

    mango 					= {name = 'mango', 			 	  	  		label = 'Fresh Mango', 				    weight = 200, 		type = 'item', 					image = 'mango.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Mango'},
	peach 					= {name = 'peach', 			 	  	  		label = 'Fresh Peach', 				    weight = 200, 		type = 'item', 					image = 'peach.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Peach'},
	lychee 					= {name = 'lychee', 			 	  	  	label = 'Fresh Lychee', 				weight = 200, 		type = 'item', 					image = 'lychee.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Lychee'},
	pineapple 				= {name = 'pineapple', 			 	  	  	label = 'Fresh Pineapple', 				weight = 200, 		type = 'item', 					image = 'pineapple.png', 				unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Pineapple'},
	coconut 				= {name = 'coconut', 			 	  	  	label = 'Fresh Coconut', 				weight = 200, 		type = 'item', 					image = 'coconut.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Coconut'},
	strawberry 				= {name = 'strawberry', 			 	  	label = 'Fresh Strawberry', 			weight = 200, 		type = 'item', 					image = 'strawberry.png', 				unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Strawberry'},
	passionfruit 			= {name = 'passionfruit', 			 	  	label = 'Fresh Passion Fruit', 			weight = 200, 		type = 'item', 					image = 'passionfruit.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Passion Fruit'},
	lemon 					= {name = 'lemon', 			 	  	  		label = 'Fresh Lemon', 				    weight = 200, 		type = 'item', 					image = 'lemon.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Lemon'},
	almonds 				= {name = 'almonds', 			 	  	  	label = 'Fresh Almonds', 				weight = 200, 		type = 'item', 					image = 'almonds.png', 					unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Almonds'},
	
    
    tea 					= {name = 'tea', 			 	  	  	    label = 'Cup of Tea', 				    weight = 200, 		type = 'item', 					image = 'cupoftea.png', 				unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Cup of Tea'},
    coffee 					= {name = 'coffee', 			 	  	  	label = 'Cup of Coffee', 				weight = 200, 		type = 'item', 					image = 'cupofcoffee.png', 				unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Cup of Coffee'},
    hotchocolate 			= {name = 'hotchocolate', 			 	  	label = 'Cup of Hot Chocolate', 		weight = 200, 		type = 'item', 					image = 'cupofhotchocolate.png', 		unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Cup of Hot Chocolate'},
    
    smoothiecup 			= {name = 'smoothiecup', 			 	  	label = 'Smoothie Cup', 		        weight = 200, 		type = 'item', 					image = 'smoothiecup.png', 			    unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Smoothie Cup'},
    coffeecup 			    = {name = 'coffeecup', 			 	  	    label = 'Coffee Cup', 		            weight = 200, 		type = 'item', 					image = 'coffeecup.png', 			    unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Coffee Cup'},
    icecubes 			    = {name = 'icecubes', 			 	  	    label = 'Ice Cubes', 		            weight = 200, 		type = 'item', 					image = 'icecubes.png', 			    unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Frozen Ice Cubes'},
    fruitjuice 			    = {name = 'fruitjuice', 			 	  	label = 'Fruit Juice', 		            weight = 200, 		type = 'item', 					image = 'fruitjuice.png', 			    unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Fruit Juice'},
    
    
    chocolatedoughnut 		= {name = 'chocolatedoughnut', 			 	label = 'Chocolate Doughnut', 		    weight = 200, 		type = 'item', 					image = 'chocolatedougnut.png', 		unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Chocolate Dougnut'},
    jamdoughnut 			= {name = 'jamdoughnut', 			 	  	label = 'Jam Doughnut', 		        weight = 200, 		type = 'item', 					image = 'jamdougnut.png', 			    unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Jam Dougnut'},
    custarddoughnut 		= {name = 'custarddoughnut', 			 	label = 'Custard Doughnut', 		    weight = 200, 		type = 'item', 					image = 'custarddougnut.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Custard Dougnut'},
    yumyum 			        = {name = 'yumyum', 			 	  	    label = 'Iced Yum-Yum', 		        weight = 200, 		type = 'item', 					image = 'yumyum.png', 			        unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Iced Yum-Yum'},
    icedbun 			    = {name = 'icedbun', 			 	  	    label = 'Iced Bun', 		            weight = 200, 		type = 'item', 					image = 'icedbun.png', 			        unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Iced Bun'},
    
    mangosmoothie 			= {name = 'mangosmoothie', 			 	  	label = 'Mango Smoothie', 		        weight = 200, 		type = 'item', 					image = 'mangosmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Mango Smoothie'},
    peachsmoothie 			= {name = 'peachsmoothie', 			 	  	label = 'Peach Smoothie', 		        weight = 200, 		type = 'item', 					image = 'peachsmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Peach Smoothie'},
    lycheesmoothie 			= {name = 'lycheesmoothie', 			 	label = 'Lychee Smoothie', 		        weight = 200, 		type = 'item', 					image = 'lycheesmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Lychee Smoothie'},
    pineapplesmoothie 		= {name = 'pineapplesmoothie', 			 	label = 'Pineapple Smoothie', 		    weight = 200, 		type = 'item', 					image = 'pineapplesmoothie.png', 		unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Pineapple Smoothie'},
    coconutsmoothie 		= {name = 'coconutsmoothie', 			 	label = 'Coconut Smoothie', 		    weight = 200, 		type = 'item', 					image = 'coconutsmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Coconut Smoothie'},
    strawberrysmoothie 		= {name = 'strawberrysmoothie', 			label = 'Strawberry Smoothie', 		    weight = 200, 		type = 'item', 					image = 'strawberrysmoothie.png', 		unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Strawberry Smoothie'},
    passionfruitsmoothie 	= {name = 'passionfruitsmoothie', 			label = 'Passion Fruit Smoothie', 		weight = 200, 		type = 'item', 					image = 'passionfruitsmoothie.png', 	unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Passion Fruit Smoothie'},
    lemonsmoothie 			= {name = 'lemonsmoothie', 			 	  	label = 'Lemon Smoothie', 		        weight = 200, 		type = 'item', 					image = 'lemonsmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Lemon Smoothie'},
    almondsmoothie 			= {name = 'almondsmoothie', 			 	label = 'Almond Smoothie', 		        weight = 200, 		type = 'item', 					image = 'almondsmoothie.png', 			unique = false, 	useable = true, 	shouldClose = true,   combinable = nil,   description = 'Fresh Almond Smoothie'},
	


```


## OX_INVENTORY ITEMS

```



	["peach"] = {
		label = "Fresh Peach",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Peach",
		client = {
			image = "peach.png",
		}
	},

	["coffeecup"] = {
		label = "Coffee Cup",
		weight = 200,
		stack = true,
		close = true,
		description = "Coffee Cup",
		client = {
			image = "coffeecup.png",
		}
	},

	["lemonsmoothie"] = {
		label = "Lemon Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Lemon Smoothie",
		client = {
			image = "lemonsmoothie.png",
		}
	},

	["passionfruitsmoothie"] = {
		label = "Passion Fruit Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Passion Fruit Smoothie",
		client = {
			image = "passionfruitsmoothie.png",
		}
	},

	["lychee"] = {
		label = "Fresh Lychee",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Lychee",
		client = {
			image = "lychee.png",
		}
	},

	["icedbun"] = {
		label = "Iced Bun",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Iced Bun",
		client = {
			image = "icedbun.png",
		}
	},

	["chocolatedoughnut"] = {
		label = "Chocolate Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Chocolate Dougnut",
		client = {
			image = "chocolatedougnut.png",
		}
	},

	["coffee"] = {
		label = "Cup of Coffee",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Cup of Coffee",
		client = {
			image = "coffee.png",
		}
	},

	["pineapple"] = {
		label = "Fresh Pineapple",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Pineapple",
		client = {
			image = "pineapple.png",
		}
	},

	["jamdoughnut"] = {
		label = "Jam Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Jam Dougnut",
		client = {
			image = "jamdougnut.png",
		}
	},

	["yumyum"] = {
		label = "Iced Yum-Yum",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Iced Yum-Yum",
		client = {
			image = "yumyum.png",
		}
	},

	["almonds"] = {
		label = "Fresh Almonds",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Almonds",
		client = {
			image = "almonds.png",
		}
	},

	["strawberrysmoothie"] = {
		label = "Strawberry Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Strawberry Smoothie",
		client = {
			image = "strawberrysmoothie.png",
		}
	},

	["passionfruit"] = {
		label = "Fresh Passion Fruit",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Passion Fruit",
		client = {
			image = "passionfruit.png",
		}
	},

	["tea"] = {
		label = "Cup of Tea",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Cup of Tea",
		client = {
			image = "tea.png",
		}
	},

	["lycheesmoothie"] = {
		label = "Lychee Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Lychee Smoothie",
		client = {
			image = "lycheesmoothie.png",
		}
	},

	["mangosmoothie"] = {
		label = "Mango Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Mango Smoothie",
		client = {
			image = "mangosmoothie.png",
		}
	},

	["icecubes"] = {
		label = "Ice Cubes",
		weight = 200,
		stack = true,
		close = true,
		description = "Frozen Ice Cubes",
		client = {
			image = "icecubes.png",
		}
	},

	["smoothiecup"] = {
		label = "Smoothie Cup",
		weight = 200,
		stack = true,
		close = true,
		description = "Smoothie Cup",
		client = {
			image = "smoothiecup.png",
		}
	},

	["mango"] = {
		label = "Fresh Mango",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Mango",
		client = {
			image = "mango.png",
		}
	},

	["custarddoughnut"] = {
		label = "Custard Doughnut",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Custard Dougnut",
		client = {
			image = "custarddougnut.png",
		}
	},

	["coconut"] = {
		label = "Fresh Coconut",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Coconut",
		client = {
			image = "coconut.png",
		}
	},

	["fruitjuice"] = {
		label = "Fruit Juice",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Fruit Juice",
		client = {
			image = "fruitjuice.png",
		}
	},

	["coconutsmoothie"] = {
		label = "Coconut Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Coconut Smoothie",
		client = {
			image = "coconutsmoothie.png",
		}
	},

	["hotchocolate"] = {
		label = "Cup of Hot Chocolate",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Cup of Hot Chocolate",
		client = {
			image = "hotchocolate.png",
		}
	},

	["peachsmoothie"] = {
		label = "Peach Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Peach Smoothie",
		client = {
			image = "peachsmoothie.png",
		}
	},

	["almondsmoothie"] = {
		label = "Almond Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Almond Smoothie",
		client = {
			image = "almondsmoothie.png",
		}
	},

	["pineapplesmoothie"] = {
		label = "Pineapple Smoothie",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Pineapple Smoothie",
		client = {
			image = "pineapplesmoothie.png",
		}
	},

	["lemon"] = {
		label = "Fresh Lemon",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Lemon",
		client = {
			image = "lemon.png",
		}
	},

	["strawberry"] = {
		label = "Fresh Strawberry",
		weight = 200,
		stack = true,
		close = true,
		description = "Fresh Strawberry",
		client = {
			image = "strawberry.png",
		}
	},


```







	
	
