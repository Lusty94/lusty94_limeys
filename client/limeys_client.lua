local QBCore = exports['qb-core']:GetCoreObject()
local InvType = Config.CoreSettings.Inventory.Type
local TargetType = Config.CoreSettings.Target.Type
local NotifyType = Config.CoreSettings.Notify.Type
local onDuty, busy = false, false
PlayerJob = {}

if Config.DevMode then
    onDuty = true
end

--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Limeys: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Limeys" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message.") return end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(msg,type,time)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(title, msg, time, type, true)
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, msg)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(title, msg, type, time)
    elseif NotifyType == 'ox' then
        lib.notify({ title = title, description = msg, type = type, duration = time})
    elseif NotifyType == 'custom' then
        --insert your own notify function here
    end
end


--Blips
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)


--THIS CLEARS THE MLO OF PEDS FROM THE CENTRE OF THE MLO AT A RADIUS OF 20.0 AS SOMETIMES PED SPAWN INSIDE THE BUILDING AND KEEP TRYING TO GO THROUGH WALLS
CreateThread(function()
    while true do
        Wait(1000)
        ClearAreaOfPeds(257.95, -1022.84, 29.31, 20.0, true) -- if changing MLO locations then might need to change this or remove it completely
    end
end) 


------------------------------< SMOOTHIES >------------------------


--Prepare Mango Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareMangoSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:MangoSmoothie', function(HasItems)  
        if HasItems then
                if busy then
                    SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        if lib.progressCircle({ 
                            duration = Config.CoreSettings.Timers.PrepareDrinks, 
                            label = Config.Language.ProgressBar.PrepareSmoothie, 
                            position = 'bottom', 
                            useWhileDead = false, 
                            canCancel = true, 
                            disable = { car = true, move = true, }, 
                            anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                        }) then
                            TriggerServerEvent('lusty94_limeys:server:CreateMangoSmoothie')
                            busy = false
                            LockInventory(false)
                        else 
                            busy = false
                            LockInventory(false)
                            SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                        end
                    else
                        SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                    end
                end
            else
                SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
            end
        end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Peach Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePeachSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PeachSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, }, 
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreatePeachSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Lychee Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLycheeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LycheeSmoothie', function(HasItems)  
            if HasItems then
                if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, }, 
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateLycheeSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Pineapple Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePineappleSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PineappleSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreatePineappleSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)

--Prepare Coconut Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareCoconutSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoconutSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, }, 
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateCoconutSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateStrawberrySmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)

--Prepare PassionFruit Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePassionFruitSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PassionFruitSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreatePassionFruitSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Lemon Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLemonSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LemonSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateLemonSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)  

--Prepare Almond Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareAlmondSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:AlmondSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareSmoothie, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateAlmondSmoothie')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 



------------------------------< HOT DRINKS >------------------------

--Prepare Tea
RegisterNetEvent("lusty94_limeys:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareHotDrink, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateTea')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare Coffee
RegisterNetEvent("lusty94_limeys:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareHotDrink, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateCoffee')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 

--Prepare HotChocolate
RegisterNetEvent("lusty94_limeys:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify(Config.Language.Notifications.Busy, 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            if lib.progressCircle({ 
                                duration = Config.CoreSettings.Timers.PrepareDrinks, 
                                label = Config.Language.ProgressBar.PrepareHotDrink, 
                                position = 'bottom', 
                                useWhileDead = false, 
                                canCancel = true, 
                                disable = { car = true, move = true, },
                                anim = { dict = Config.Animations.PrepareIngredients.AnimDict, clip = Config.Animations.PrepareIngredients.Anim, flag = Config.Animations.PrepareIngredients.Flags, },
                            }) then
                                TriggerServerEvent('lusty94_limeys:server:CreateHotChocolate')
                                busy = false
                                LockInventory(false)
                            else 
                                busy = false
                                LockInventory(false)
                                SendNotify(Config.Language.Notifications.Cancelled, 'error', 2000)
                            end
                        else
                            SendNotify(Config.Language.Notifications.Failed, 'error', 2000)
                        end
                    end
                else
                    SendNotify(Config.Language.Notifications.MissingItems, 'error', 2500)
                end
            end)
    else 
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end) 





------------------------------< STASHES AND SHOPS >------------------------

--collection tray
RegisterNetEvent("lusty94_limeys:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        TriggerServerEvent('lusty94_limeys:server:CollectionTray')
    elseif InvType == 'ox' then
        exports.ox_inventory:openInventory('stash', 'limeyscollectiontray') -- if changing stash name in ox make sure you change it here too
    end
end)


--storage fridge
RegisterNetEvent("lusty94_limeys:client:OpenStorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerServerEvent('lusty94_limeys:server:StorageFridge')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('stash', 'limeysstoragefridge')
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)


--ingredients tray
AddEventHandler("lusty94_limeys:client:IngredientsTray", function()
    if onDuty then
        if InvType == 'qb'then
            TriggerServerEvent('lusty94_limeys:server:IngredientsTray')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'LimeysIngredients' })
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)


--snack shelf
AddEventHandler("lusty94_limeys:client:SnackShelf", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerServerEvent('lusty94_limeys:server:SnackShelf')
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'LimeysSnacks' })
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)


------------------------------< CUP INPUTS >------------------------

-- smoothie cup input
RegisterNetEvent('lusty94_limeys:client:GiveSmoothieCup', function(data) 
    local input = lib.inputDialog('Limeys Juice Bar', {
        {type = 'number', label = 'Smoothie Cups', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_limeys:server:GiveSmoothieCup', tonumber(input[1]))
    end
end)

--coffee cup input
RegisterNetEvent('lusty94_limeys:client:GiveCoffeeCup', function(data) 
    local input = lib.inputDialog('Limeys Juice Bar', {
        {type = 'number', label = 'Coffee Cups', description = 'How many do you need?', icon = 'arrow-right'},
      })
    if input then
        TriggerServerEvent('lusty94_limeys:server:GiveCoffeeCup', tonumber(input[1]))
    end
end)



------------------------------< BILLING >------------------------

--billing
RegisterNetEvent("lusty94_limeys:client:bill")
AddEventHandler("lusty94_limeys:bill", function()
    if onDuty then
        if onDuty then
            local bill = lib.inputDialog('Limeys Payment Till', {
                {type = 'input',  label = 'Citizen ID', description = 'Players Citizen ID',     icon = 'hashtag'},
                {type = 'number', label = 'Bill Price', description = 'The Bills Total Price',  icon = 'dollar-sign'}
            })
            if bill ~= nil then
                if bill[1] == nil or bill[2] == nil then
                    return
                end
                TriggerServerEvent('lusty94_limeys:server:bill:player', bill[1], bill[2])
            end
        else
            SendNotify(Config.Language.Notifications.Duty, 'error', 2000)
        end
    else
        SendNotify(Config.Language.Notifications.Duty, 'error', 2500)
    end
end)



------------------------------< CONSUMABLES >------------------------

--eat food items
RegisterNetEvent('lusty94_limeys:client:eatFood', function(itemName)
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        busy = true
        LockInventory(true)
        if lib.progressCircle({ 
            duration = Config.CoreSettings.Timers.Eat, 
            label = Config.Language.ProgressBar.Eat, 
            position = 'bottom', 
            useWhileDead = false, 
            canCancel = true, 
            disable = { car = false, move = false, }, 
            anim = { dict = Config.Animations.Eat.AnimDict, clip = Config.Animations.Eat.Anim, flag = Config.Animations.Eat.Flag,}, 
            prop = { model = Config.Animations.Eat.Prop, bone = Config.Animations.Eat.Bone, pos = Config.Animations.Eat.Pos, rot = Config.Animations.Eat.Rot,},
        }) then
            TriggerServerEvent("lusty94_limeys:server:eatFood", itemName)
            TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + Config.Consumables.Food[itemName])
            busy = false
            LockInventory(false)
        else 
            busy = false
            LockInventory(false)
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
        end
    end
end)

--drink
RegisterNetEvent('lusty94_limeys:client:Drink', function(itemName)
    if busy then
        SendNotify(Config.Language.Notifications.Busy, 'error', 2000)
    else
        busy = true
        LockInventory(true)
        if lib.progressCircle({ 
            duration = Config.CoreSettings.Timers.Drink, 
            label = Config.Language.ProgressBar.Drink, 
            position = 'bottom', 
            useWhileDead = false, 
            canCancel = true, 
            disable = { car = false, move = false, }, 
            anim = { dict = Config.Animations.Drink.AnimDict, clip = Config.Animations.Drink.Anim, flag = Config.Animations.Drink.Flag,}, 
            prop = { model = Config.Animations.Drink.Prop, bone = Config.Animations.Drink.Bone, pos = Config.Animations.Drink.Pos, rot = Config.Animations.Drink.Rot,},
        }) then
            TriggerServerEvent("lusty94_limeys:server:Drink", itemName)
            TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.Consumables.Drink[itemName])
            busy = false
            LockInventory(false)
        else 
            busy = false
            LockInventory(false)
            SendNotify(Config.Language.Notifications.CancelledName, 'error', 2000)
        end
    end
end)



------------------------------< DONT TOUCH >------------------------

-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        LocalPlayer.state:set("inv_busy", true, true) -- used by qb, ps and ox
        --this is the old method below
        --[[        
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end        
        ]]
    else
        LocalPlayer.state:set("inv_busy", false, true) -- used by qb, ps and ox
        --this is the old method below
        --[[        
        if InvType == 'qb' then
            this is for the old method if using old qb and ox
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end        
        ]]
    end
end

--function to display item images
function ItemImage(img)
	if InvType == 'ox' then
		return 'nui://ox_inventory/web/images/'.. img.. '.png'
	elseif InvType == 'qb' then
		return 'nui://qb-inventory/html/images/'.. QBCore.Shared.Items[img].image
	end
end

--job stuff dont touch 
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
   QBCore.Functions.GetPlayerData(function(PlayerData)
       PlayerJob = PlayerData.job
   end)
end)
--job stuff dont touch 
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
   PlayerJob = JobInfo
   onDuty = PlayerJob.onduty
end)
--job stuff dont touch 
RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
   onDuty = duty
end)
--job stuff dont touch 
RegisterNetEvent("lusty94_limeys:client:ToggleDuty")
AddEventHandler("lusty94_limeys:client:ToggleDuty", function()
   TriggerServerEvent("QBCore:ToggleDuty")
end)


--dont touch
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        for k, v in pairs(Config.InteractionLocations.JobAreas) do if TargetType == 'qb' then exports['qb-target']:RemoveZone(v.Name) elseif TargetType == 'ox' then exports.ox_target:removeZone(v.Name) end end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Limeys V2.0.1 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)