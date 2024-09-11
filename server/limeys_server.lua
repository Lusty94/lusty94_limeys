local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local NotifyType = Config.CoreSettings.Notify.Type

--notification function
local function SendNotify(src, msg, type, time, title)
    if NotifyType == nil then print("Lusty94_Limeys: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Limeys" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end

--useable items for eating
for k,_ in pairs(Config.Consumables.Food) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        TriggerClientEvent("lusty94_limeys:client:eatFood", source, item.name)
    end)
end


--useable items for drinking
for k,_ in pairs(Config.Consumables.Drink) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        TriggerClientEvent("lusty94_limeys:client:Drink", source, item.name)
    end)
end

--eat food
RegisterNetEvent('lusty94_limeys:server:eatFood', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local limeysfoods = nil
    for k in pairs(Config.Consumables.Food) do
        if k == item then
            limeysfoods = k
            break
        end
    end
    if not limeysfoods then return end
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, limeysfoods, 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[limeysfoods], 'remove', 1)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, limeysfoods, 1)
    end
end)


--drink
RegisterNetEvent('lusty94_limeys:server:Drink', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local limeysdrinks = nil
    for k in pairs(Config.Consumables.Drink) do
        if k == item then
            limeysdrinks = k
            break
        end
    end
    if not limeysdrinks then return end
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, limeysdrinks, 1, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[limeysdrinks], 'remove', 1)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, limeysdrinks, 1)
    end
end)


--Give Smoothie Cup
RegisterNetEvent('lusty94_limeys:server:GiveSmoothieCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then
        if exports['qb-inventory']:AddItem(src, 'smoothiecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'smoothiecup', amount) then
            exports.ox_inventory:AddItem(src,"smoothiecup", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)

--Give Coffee Cup
RegisterNetEvent('lusty94_limeys:server:GiveCoffeeCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:AddItem(src, 'coffeecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffeecup'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'coffeecup', amount) then
            exports.ox_inventory:AddItem(src,"coffeecup", amount)
        else
            SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
        end
    end
end)

--Coffee Cup Callback For Hot Drinks
QBCore.Functions.CreateCallback('lusty94_limeys:get:CoffeeCup', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cup = Player.Functions.GetItemByName("coffeecup")
    if cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Tea
RegisterNetEvent('lusty94_limeys:server:CreateTea', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'coffeecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffeecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'tea', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['tea'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"coffeecup", amount) then
            if exports.ox_inventory:CanCarryItem(src, 'tea', amount) then
                exports.ox_inventory:AddItem(src,"tea", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Coffee
RegisterNetEvent('lusty94_limeys:server:CreateCoffee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1     
    if not Player then return end
    if InvType == 'qb' then   
        if exports['qb-inventory']:RemoveItem(src, 'coffeecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffeecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'coffee', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffee'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"coffeecup", amount) then
            if exports.ox_inventory:CanCarryItem(src, 'coffee', amount) then
                exports.ox_inventory:AddItem(src,"coffee", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

--Create Hot Chocolate
RegisterNetEvent('lusty94_limeys:server:CreateHotChocolate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1 
    if not Player then return end 
    if InvType == 'qb' then      
        if exports['qb-inventory']:RemoveItem(src, 'coffeecup', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coffeecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'hotchocolate', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['hotchocolate'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"coffeecup", amount) then
            if exports.ox_inventory:CanCarryItem(src, 'hotchocolate', amount) then
                exports.ox_inventory:AddItem(src,"hotchocolate", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


-- Mango Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:MangoSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("mango")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Mango Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateMangoSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'mango', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mango'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'mangosmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['mangosmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"mango", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'mangosmoothie', amount) then
                exports.ox_inventory:AddItem(src,"mangosmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Peach Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PeachSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("peach")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Peach Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePeachSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1 
    if not Player then return end
    if InvType == 'qb' then      
        if exports['qb-inventory']:RemoveItem(src, 'peach', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['peach'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'peachsmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['peachsmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"peach", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'peachsmoothie', amount) then
                exports.ox_inventory:AddItem(src,"peachsmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Lychee Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:LycheeSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("lychee")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Lychee Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateLycheeSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1 
    if not Player then return end
    if InvType == 'qb' then       
        if exports['qb-inventory']:RemoveItem(src, 'lychee', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['lychee'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'lycheesmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['lycheesmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"lychee", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'lycheesmoothie', amount) then
                exports.ox_inventory:AddItem(src,"lycheesmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Pineapple Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PineappleSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("pineapple")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Pineapple Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePineappleSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1 
    if not Player then return end
    if InvType == 'qb' then       
        if exports['qb-inventory']:RemoveItem(src, 'pineapple', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pineapple'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'pineapplesmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['pineapplesmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"pineapple", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'pineapplesmoothie', amount) then
                exports.ox_inventory:AddItem(src,"pineapplesmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Coconut Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:CoconutSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("coconut")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Coconut Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateCoconutSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'coconut', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coconut'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'coconutsmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['coconutsmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"coconut", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'coconutsmoothie', amount) then
                exports.ox_inventory:AddItem(src,"coconutsmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Strawberry Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:StrawberrySmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("strawberry")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Strawberry Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateStrawberrySmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1  
    if not Player then return end      
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, 'strawberry', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberry'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'strawberrysmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['strawberrysmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"strawberry", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'strawberrysmoothie', amount) then
                exports.ox_inventory:AddItem(src,"strawberrysmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- PassionFruit Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:PassionFruitSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("passionfruit")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create PassionFruit Smoothie
RegisterNetEvent('lusty94_limeys:server:CreatePassionFruitSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'passionfruit', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['passionfruit'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'passionfruitsmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['passionfruitsmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"passionfruit", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'passionfruitsmoothie', amount) then
                exports.ox_inventory:AddItem(src,"passionfruitsmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Lemon Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:LemonSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("lemon")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Lemon Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateLemonSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1 
    if not Player then return end
    if InvType == 'qb' then        
        if exports['qb-inventory']:RemoveItem(src, 'lemon', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['lemon'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'lemonsmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['lemonsmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"lemon", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'lemonsmoothie', amount) then
                exports.ox_inventory:AddItem(src,"lemonsmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)

-- Almond Smoothie Callback
QBCore.Functions.CreateCallback('lusty94_limeys:get:AlmondSmoothie', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fruit = Player.Functions.GetItemByName("almonds")
    local juice = Player.Functions.GetItemByName("fruitjuice")
    local ice = Player.Functions.GetItemByName("icecubes")
    local cup = Player.Functions.GetItemByName("smoothiecup")
    if fruit and juice and ice and cup then
        cb(true)
    else
        cb(false)
    end
end)

--Create Almond Smoothie
RegisterNetEvent('lusty94_limeys:server:CreateAlmondSmoothie', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1  
    if not Player then return end
    if InvType == 'qb' then      
        if exports['qb-inventory']:RemoveItem(src, 'almonds', amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['almonds'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'fruitjuice', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['fruitjuice'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'icecubes', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['icecubes'], 'remove', amount)
            exports['qb-inventory']:RemoveItem(src, 'smoothiecup', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['smoothiecup'], 'remove', amount)
            exports['qb-inventory']:AddItem(src, 'almondssmoothie', amount, false, false, false)
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items['almondssmoothie'], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,"almonds", amount) then
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            if exports.ox_inventory:CanCarryItem(src, 'almondsmoothie', amount) then
                exports.ox_inventory:AddItem(src,"almondsmoothie", amount)
            else
                SendNotify(src,Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
end)


---------------------------< QB-INVENTORY SHOPS / STASHES >----------------------------------------
--ingredients shop
RegisterNetEvent('lusty94_limeys:server:IngredientsTray', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local limeysIngredients = {
        {name = "icecubes",         price = 0, amount = 100000, info = {}, type = "item", slot = 1,},
        {name = "fruitjuice",       price = 0, amount = 100000, info = {}, type = "item", slot = 2,},
        {name = "mango",            price = 0, amount = 100000, info = {}, type = "item", slot = 3,},
        {name = "peach",            price = 0, amount = 100000, info = {}, type = "item", slot = 4,},
        {name = "lychee",           price = 0, amount = 100000, info = {}, type = "item", slot = 5,},
        {name = "pineapple",        price = 0, amount = 100000, info = {}, type = "item", slot = 6,},
        {name = "coconut",          price = 0, amount = 100000, info = {}, type = "item", slot = 7,},
        {name = "strawberry",       price = 0, amount = 100000, info = {}, type = "item", slot = 8,},
        {name = "passionfruit",     price = 0, amount = 100000, info = {}, type = "item", slot = 9,},
        {name = "lemon",            price = 0, amount = 100000, info = {}, type = "item", slot = 10,},
        {name = "almonds",          price = 0, amount = 100000, info = {}, type = "item", slot = 11,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'limeysIngredients',
        label = 'Limeys Ingredients',
        slots = 11,
        items = limeysIngredients
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'limeysIngredients')
    end
end)

--snacks shop
RegisterNetEvent('lusty94_limeys:server:SnackShelf', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local limeysSnacks = {
        {name = "chocolatedoughnut",        price = 10, amount = 100000, info = {}, type = "item", slot = 1,},
        {name = "jamdoughnut",              price = 10, amount = 100000, info = {}, type = "item", slot = 2,},
        {name = "custarddoughnut",          price = 10, amount = 100000, info = {}, type = "item", slot = 3,},
        {name = "yumyum",                   price = 10, amount = 100000, info = {}, type = "item", slot = 4,},
        {name = "icedbun",                  price = 10, amount = 100000, info = {}, type = "item", slot = 5,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'limeysSnacks',
        label = 'Limeys Snacks',
        slots = 5,
        items = limeysSnacks
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'limeysSnacks')
    end
end)

--storage fridge
RegisterNetEvent('lusty94_limeys:server:StorageFridge', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local stashName = 'Limeys Storage Fridge'
    local stashInfo = {
        weight = 100000000,
        slots = 64,
    }
    if Player then
        exports['qb-inventory']:OpenInventory(src, stashName, {
            maxweight = stashInfo.weight,
            slots = stashInfo.slots,
        })
    end
end)

--collection tray
RegisterNetEvent('lusty94_limeys:server:CollectionTray', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local stashName = 'Limeys Collection Tray'
    local stashInfo = {
        weight = 1000000,
        slots = 5,
    }
    if Player then
        exports['qb-inventory']:OpenInventory(src, stashName, {
            maxweight = stashInfo.weight,
            slots = stashInfo.slots,
        })
    end
end)



-------------------------< REGISTERING OX STUFF ON START >-----------------

--attachments shop
function limeysIngredients()
    exports.ox_inventory:RegisterShop('LimeysIngredients', {
        name = 'Limeys Ingredients',
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
        groups = {
            limeys = 0
        },
    })    
end

--tints shop
function limeysSnacks()
    exports.ox_inventory:RegisterShop('LimeysSnacks', {
        name = 'Limeys Snack Shelf',
        inventory = {
            { name = 'chocolatedoughnut', price = 0 },
            { name = 'jamdoughnut', price = 0 },
            { name = 'custarddoughnut', price = 0 },
            { name = 'yumyum', price = 0 },
            { name = 'icedbun', price = 0 },
        },
        groups = {
            limeys = 0
        },
    })
end

--collection tray
function limeysCollectionTray()
    local collectionTray = {
        id = 'limeyscollectiontray',
        label = 'Limeys Collection Tray',
        slots = 5,
        weight = 10000000,
        owner = false,
    }
    exports.ox_inventory:RegisterStash(collectionTray.id, collectionTray.label, collectionTray.slots, collectionTray.weight, collectionTray.owner, collectionTray.jobs)
end
--weapon storage
function limeysStorageFridge()
    local storage = {
        id = 'limeysstoragefridge',
        label = 'Limeys Storage Fridge',
        slots = 64,
        weight = 10000000,
        owner = true,
        jobs = {["limeys"] = 0},
    }
    exports.ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner, storage.jobs)
end


-- dont touch this is for ox stashes and shops
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Limeys |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops and stashes automatically |^5 ^5--<^3!^5>--^7')
            limeysIngredients()
            limeysSnacks()
            limeysCollectionTray()
            limeysStorageFridge()
            print('^5--<^3!^5>-- ^7| Shops and stashes registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Limeys/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^5Current^7: "..currentVersion.." ^5Latest^7: "..newestVersion.." "..advice) end
	end)
end
CheckVersion()