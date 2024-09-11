
--smothies menu
lib.registerContext({
    id = 'SmoothiesMenu',
    title = 'Prepare Fresh Fruit Smoothies!',
    options = {
      {
        title = 'Get Smoothie Cup',
        event = 'lusty94_limeys:client:GiveSmoothieCup',
        arrow = true,
        icon = ItemImage('smoothiecup'),
        image = ItemImage('smoothiecup'),
      },
      {
        title = 'Prepare Mango Smoothie',
        event = 'lusty94_limeys:client:PrepareMangoSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Mango \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('mangosmoothie'),
        image = ItemImage('mangosmoothie'),
      },
      {
        title = 'Prepare Peach Smoothie',
        event = 'lusty94_limeys:client:PreparePeachSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Peach \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('peachsmoothie'),
        image = ItemImage('peachsmoothie'),
      },
      {
        title = 'Prepare Lychee Smoothie',
        event = 'lusty94_limeys:client:PrepareLycheeSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Lychee \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('lycheesmoothie'),
        image = ItemImage('lycheesmoothie'),
      },
      {
        title = 'Prepare Pineapple Smoothie',
        event = 'lusty94_limeys:client:PreparePineappleSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Pineapple \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('pineapplesmoothie'),
        image = ItemImage('pineapplesmoothie'),
      },
      {
        title = 'Prepare Coconut Smoothie',
        event = 'lusty94_limeys:client:PrepareCoconutSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Coconut \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('coconutsmoothie'),
        image = ItemImage('coconutsmoothie'),
      },
      {
        title = 'Prepare Strawberry Smoothie',
        event = 'lusty94_limeys:client:PrepareStrawberrySmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Strawberry \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('strawberrysmoothie'),
        image = ItemImage('strawberrysmoothie'),
      },
      {
        title = 'Prepare Passion Fruit Smoothie',
        event = 'lusty94_limeys:client:PreparePassionFruitSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Passion Fruit \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('passionfruitsmoothie'),
        image = ItemImage('passionfruitsmoothie'),
      },
      {
        title = 'Prepare Lemon Smoothie',
        event = 'lusty94_limeys:client:PrepareLemonSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Lemon \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('lemonsmoothie'),
        image = ItemImage('lemonsmoothie'),
      },
      {
        title = 'Prepare Almond Smoothie',
        event = 'lusty94_limeys:client:PrepareAlmondSmoothie',
        arrow = true,
        description = 'Ingredients Required: \n Almond \n Fruit Juice \n Ice Cubes \n Smoothie Cup',
        icon = ItemImage('almondsmoothie'),
        image = ItemImage('almondsmoothie'),
      },      
    }
})






lib.registerContext({
    id = 'HotDrinksMenu',
    title = 'Prepare Hot Drinks!',
    options = {
      {
        title = 'Get A Coffee Cup',
        icon = 'mug-saucer',
        event = 'lusty94_limeys:client:GiveCoffeeCup',
        arrow = true,
        icon = ItemImage('coffeecup'),
        image = ItemImage('coffeecup'),
      },
      {
        title = 'Prepare Cup of Tea',
        event = 'lusty94_limeys:client:PrepareTea',
        description = 'Coffee Cup Required',
        arrow = true,
        description = 'Coffe Cup Required',
        icon = ItemImage('tea'),
        image = ItemImage('tea'),
      },
      {
        title = 'Prepare Cup of Coffee',
        event = 'lusty94_limeys:client:PrepareCoffee',
        description = 'Coffee Cup Required',
        arrow = true,
        description = 'Coffe Cup Required',
        icon = ItemImage('coffee'),
        image = ItemImage('coffee'),
      },
      {
        title = 'Prepare Cup of Hot Chocolate',
        event = 'lusty94_limeys:client:PrepareHotChocolate',
        description = 'Coffee Cup Required',
        arrow = true,
        description = 'Coffe Cup Required',
        icon = ItemImage('hotchocolate'),
        image = ItemImage('hotchocolate'),
      },
    }
})





RegisterNetEvent('lusty94_limeys:client:SmoothieMenu', function()
    lib.showContext('SmoothiesMenu')
end)

RegisterNetEvent('lusty94_limeys:client:HotDrinksMenu', function()
    lib.showContext('HotDrinksMenu')
end)