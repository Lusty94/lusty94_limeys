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



--Give Smoothie Cup
RegisterNetEvent('lusty94_limeys:server:GiveSmoothieCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then        
        Player.Functions.AddItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'smoothiecup', amount) then
            exports.ox_inventory:AddItem(src,"smoothiecup", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
end)

--Give Coffee Cup
RegisterNetEvent('lusty94_limeys:server:GiveCoffeeCup', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then        
        Player.Functions.AddItem("coffeecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'coffeecup', amount) then
            exports.ox_inventory:AddItem(src,"coffeecup", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("coffeecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove", amount)
        Player.Functions.AddItem("tea", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["tea"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'tea', amount) then
            exports.ox_inventory:RemoveItem(src,"coffeecup", amount)
            exports.ox_inventory:AddItem(src,"tea", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("coffeecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove", amount)
        Player.Functions.AddItem("coffee", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffee"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'coffee', amount) then
            exports.ox_inventory:RemoveItem(src,"coffeecup", amount)
            exports.ox_inventory:AddItem(src,"coffee", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("coffeecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffeecup"], "remove", amount)
        Player.Functions.AddItem("hotchocolate", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["hotchocolate"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'hotchocolate', amount) then
            exports.ox_inventory:RemoveItem(src,"coffeecup", amount)
            exports.ox_inventory:AddItem(src,"hotchocolate", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("mango", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mango"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("mangosmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["mangosmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'mangosmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"mango", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"mangosmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("peach", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["peach"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("peachsmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["peachsmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'peachsmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"peach", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"peachsmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("lychee", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lychee"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("lycheesmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lycheesmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'lycheesmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"lychee", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"lycheesmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("pineapple", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pineapple"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("pineapplesmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["pineapplesmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'pineapplesmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"pineapple", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"pineapplesmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("coconut", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coconut"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("coconutsmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coconutsmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'coconutsmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"coconut", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"coconutsmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("strawberry", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberry"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("strawberrysmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["strawberrysmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'strawberrysmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"strawberry", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"strawberrysmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("passionfruit", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["passionfruit"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("passionfruitsmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["passionfruitsmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'passionfruitsmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"passionfruit", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"passionfruitsmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("lemon", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lemon"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("lemonsmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lemonsmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'lemonsmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"lemon", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"lemonsmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
        Player.Functions.RemoveItem("almonds", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["almonds"], "remove", amount)
        Player.Functions.RemoveItem("fruitjuice", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["fruitjuice"], "remove", amount)
        Player.Functions.RemoveItem("icecubes", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["icecubes"], "remove", amount)
        Player.Functions.RemoveItem("smoothiecup", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["smoothiecup"], "remove", amount)
        Player.Functions.AddItem("almondsmoothie", amount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["almondsmoothie"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, 'almondsmoothie', amount) then
            exports.ox_inventory:RemoveItem(src,"almonds", amount)
            exports.ox_inventory:RemoveItem(src,"fruitjuice", amount)
            exports.ox_inventory:RemoveItem(src,"icecubes", amount)
            exports.ox_inventory:RemoveItem(src,"smoothiecup", amount)
            exports.ox_inventory:AddItem(src,"almondsmoothie", amount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
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