local QBCore = exports['qb-core']:GetCoreObject()
local MenuType = Config.CoreSettings.Menu.Type



local SmoothieMenu = {
    {
        header = "Prepare Fresh Fruit Smoothies!",
        isMenuHeader = true,
    },  
    {   
        header = "Get A Smoothie Cup",
        params = {
            isServer = true,
            event = "lusty94_limeys:server:GiveSmoothieCup",
        }
    },          
    {   
        header = "Prepare Mango Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Mango, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareMangoSmoothie",
        }
    },          
    {   
        header = "Prepare Peach Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Peach, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PreparePeachSmoothie",
        }
    },          
    {   
        header = "Prepare Lychee Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Lychee, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareLycheeSmoothie",
        }
    },          
    {   
        header = "Prepare Pineapple Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Pineapple, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PreparePineappleSmoothie",
        }
    },          
    {   
        header = "Prepare Coconut Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Coconut, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareCoconutSmoothie",
        }
    },          
    {   
        header = "Prepare Strawberry Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Strawberry, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareStrawberrySmoothie",
        }
    },          
    {   
        header = "Prepare Passion Fruit Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Passion Fruit, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PreparePassionFruitSmoothie",
        }
    },
    {   
        header = "Prepare Lemon Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Lemon, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareLemonSmoothie",
        }
    },          
    {   
        header = "Prepare Almond Smoothie",
        txt = "<u>Ingredients Required:</u> <br> Fresh Almond, Fruit Juice, Ice Cubes, Smoothie Cup",
        params = {
            event = "lusty94_limeys:client:PrepareAlmondSmoothie",
        }
    },       
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}


lib.registerContext({
    id = 'SmoothieMenu',
    title = 'Prepare Fresh Fruit Smoothies!',
    options = {
      {
        title = 'Get Smoothie Cup',
        icon = 'glass-water',
        onSelect = function()
            TriggerServerEvent('lusty94_limeys:server:GiveSmoothieCup')
        end,
        arrow = true,
      },
      {
        title = 'Prepare Mango Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareMangoSmoothie',
        arrow = true,
        metadata = {
            {label = 'Mango Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Peach Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePeachSmoothie',
        arrow = true,
        metadata = {
            {label = 'Peach Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Lychee Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareLycheeSmoothie',
        arrow = true,
        metadata = {
            {label = 'Lychee Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Pineapple Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePineappleSmoothie',
        arrow = true,
        metadata = {
            {label = 'Pineapple Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Coconut Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareCoconutSmoothie',
        arrow = true,
        metadata = {
            {label = 'Coconut Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Strawberry Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareStrawberrySmoothie',
        arrow = true,
        metadata = {
            {label = 'Strawberry Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Passion Fruit Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PreparePassionFruitSmoothie',
        arrow = true,
        metadata = {
            {label = 'Passion Fruit Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Lemon Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareLemonSmoothie',
        arrow = true,
        metadata = {
            {label = 'Lemon Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      {
        title = 'Prepare Almond Smoothie',
        icon = 'blender',
        event = 'lusty94_limeys:client:PrepareAlmondSmoothie',
        arrow = true,
        metadata = {
            {label = 'Almond Required', value = 1},
            {label = 'Fruit Juice Required', value = 1},
            {label = 'Ice Cubes Required', value = 1},
            {label = 'Smoothie Cup Required', value = 1},
          },
      },
      
      
    }
})


RegisterNetEvent('lusty94_limeys:client:SmoothieMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(SmoothieMenu)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(SmoothieMenu)
    elseif MenuType == 'ox' then
        lib.showContext('SmoothieMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< SMOOTHIE MENU END >---------------------------------------------------



-------------------------------------------------------< HOT DRINKS MENU START >---------------------------------------------------
local HotDrinksMenu = {
    {
        header = "Prepare Fresh Fruit Smoothies!",
        isMenuHeader = true,
    },  
    {   
        header = "Get A Coffee Cup",
        params = {
            isServer = true,
            event = "lusty94_limeys:server:GiveCoffeeCup",
        }
    },          
    {   
        header = "Prepare Cup of Tea",
        txt = "Coffee Cup Required",
        params = {
            event = "lusty94_limeys:client:PrepareTea",
        }
    },       
    {   
        header = "Prepare Cup of Coffee",
        txt = "Coffee Cup Required",
        params = {
            event = "lusty94_limeys:client:PrepareCoffee",
        }
    },       
    {   
        header = "Prepare Cup of Hot Chocolate",
        txt = "Coffee Cup Required",
        params = {
            event = "lusty94_limeys:client:PrepareHotChocolate",
        }
    },       
    {
        header = "< Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu",
        }
    },
}

lib.registerContext({
    id = 'HotDrinksMenu',
    title = 'Prepare Hot Drinks!',
    options = {
      {
        title = 'Get A Coffee Cup',
        icon = 'mug-saucer',
        onSelect = function()
            TriggerServerEvent('lusty94_limeys:server:GiveCoffeeCup')
        end,
        arrow = true,
      },
      {
        title = 'Prepare Cup of Tea',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareTea',
        description = 'Coffee Cup Required',
        arrow = true,
      },
      {
        title = 'Prepare Cup of Coffee',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareCoffee',
        description = 'Coffee Cup Required',
        arrow = true,
      },
      {
        title = 'Prepare Cup of Hot Chocolate',
        icon = 'mug-hot',
        event = 'lusty94_limeys:client:PrepareHotChocolate',
        description = 'Coffee Cup Required',
        arrow = true,
      },
    }
})


RegisterNetEvent('lusty94_limeys:client:HotDrinksMenu', function()
    if MenuType == 'qb' then
        exports['qb-menu']:openMenu(HotDrinksMenu)
    elseif MenuType == 'jixel' then
        exports['jixel-menu']:openMenu(HotDrinksMenu)
    elseif MenuType == 'ox' then
        lib.showContext('HotDrinksMenu')
    elseif MenuType == 'custom' then
        --insert custom menu code here
    end
end)
-------------------------------------------------------< HOT DRINKS MENU END >---------------------------------------------------


