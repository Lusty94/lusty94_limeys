local QBCore = exports['qb-core']:GetCoreObject()
local ShopType = Config.CoreSettings.Shop.Type
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
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
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








--Prepare Mango Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareMangoSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:MangoSmoothie', function(HasItems)  
        if HasItems then
                if busy then
                    SendNotify("You Are Already Doing Something!", 'error', 2500)
                else
                    local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                    if success then
                        busy = true
                        LockInventory(true)
                        FreezeEntityPosition(PlayerPedId(), true) 
                        if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            DeleteEntity(chickenPed)
                            TriggerServerEvent('lusty94_limeys:server:CreateMangoSmoothie')
                            SendNotify("Smoothie prepared.", 'success', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        else 
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify('Action cancelled.', 'error', 2000)
                            FreezeEntityPosition(PlayerPedId(), false)
                        end
                    else
                        SendNotify("Action failed.", 'error', 2000)
                    end
                end
            else
                SendNotify("You are missing items!", 'error', 2500)
            end
        end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Peach Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePeachSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PeachSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreatePeachSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Lychee Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLycheeSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LycheeSmoothie', function(HasItems)  
            if HasItems then
                if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateLycheeSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Pineapple Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePineappleSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PineappleSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreatePineappleSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end)

--Prepare Coconut Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareCoconutSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoconutSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateCoconutSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Strawberry Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareStrawberrySmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:StrawberrySmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateStrawberrySmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end)

--Prepare PassionFruit Smoothie
RegisterNetEvent("lusty94_limeys:client:PreparePassionFruitSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:PassionFruitSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreatePassionFruitSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Lemon Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareLemonSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:LemonSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateLemonSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end)  

--Prepare Almond Smoothie
RegisterNetEvent("lusty94_limeys:client:PrepareAlmondSmoothie", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:AlmondSmoothie', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing smoothie...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateAlmondSmoothie')
                                SendNotify("Smoothie prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 


--Prepare Tea
RegisterNetEvent("lusty94_limeys:client:PrepareTea", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateTea')
                                SendNotify("Hot drink prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare Coffee
RegisterNetEvent("lusty94_limeys:client:PrepareCoffee", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreateCoffee')
                                SendNotify("Hot drink prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 

--Prepare HotChocolate
RegisterNetEvent("lusty94_limeys:client:PrepareHotChocolate", function()
    if onDuty then
        QBCore.Functions.TriggerCallback('lusty94_limeys:get:CoffeeCup', function(HasItems)  
            if HasItems then
                    if busy then
                        SendNotify("You Are Already Doing Something!", 'error', 2500)
                    else
                        local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'easy'}, {'e'})
                        if success then
                            busy = true
                            LockInventory(true)
                            FreezeEntityPosition(PlayerPedId(), true) 
                            if lib.progressCircle({ duration = 10000, label = 'Preparing hot drink...', position = 'bottom', useWhileDead = false, canCancel = true, disable = { car = true, }, anim = { dict = Config.Animations.PrepareIngredients.dict, clip = Config.Animations.PrepareIngredients.anim, flag = Config.Animations.PrepareIngredients.flag, },}) then
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                DeleteEntity(chickenPed)
                                TriggerServerEvent('lusty94_limeys:server:CreatehotChocolate')
                                SendNotify("Hot drink prepared.", 'success', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else 
                                busy = false
                                LockInventory(false)
                                ClearPedTasks(PlayerPedId())
                                SendNotify('Action cancelled.', 'error', 2000)
                                FreezeEntityPosition(PlayerPedId(), false)
                            end
                        else
                            SendNotify("Action failed.", 'error', 2000)
                        end
                    end
                else
                    SendNotify("You are missing items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end) 







--collection tray
RegisterNetEvent("lusty94_limeys:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        local stashInfo = {
            maxweight = 100000,
            slots = 5,
        }
        TriggerEvent("inventory:client:SetCurrentStash", "collectiontray")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "collectiontray", {
            maxweight = stashInfo.maxweight,
            slots = stashInfo.slots,
        })
    elseif InvType == 'ox' then
        exports.ox_inventory:openInventory('stash', 'limeyscollectiontray') -- if changing stash name in ox make sure you change it here too
    end
end)




--storage fridge
RegisterNetEvent("lusty94_limeys:client:OpenStorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            local stashInfo = {
                maxweight = 10000000,
                slots = 64,
            }
            TriggerEvent("inventory:client:SetCurrentStash", "limeysdrinksfridge")
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeysdrinksfridge", {
                maxweight = stashInfo.maxweight,
            slots = stashInfo.slots,
            })
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('stash', 'limeysstoragefridge')
        end
    else
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end)







--ingredients tray
AddEventHandler("lusty94_limeys:client:IngredientsTray", function()
    if onDuty then
        local limeysIngredients = { -- this is only relevant if using qb-inventory - ox users change item names and prices in server file
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
        }
        if ShopType == 'qb'then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "LimeysIngredients", limeysIngredients)
        elseif ShopType == 'jim' then
            TriggerServerEvent("jim-shops:ShopOpen", "shop", "LimeysIngredients", limeysIngredients)
        elseif ShopType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'LimeysIngredients' })
        end
    else
        SendNotify("You must be on duty to proceed!", 'error', 2500)
    end
end)

--snack shelf {doesnt go to society}
AddEventHandler("lusty94_limeys:client:SnackShelf", function()
    local limeysSnacksShelf = { -- this is only relevant if using qb-inventory - ox users change item names and prices in server file
        label = "Snack Shelf", 
        slots = 5,
        items = {
            [1] = {name = "chocolatedoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 1,},
            [2] = {name = "jamdoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 2,},
            [3] = {name = "custarddoughnut", price = 10, amount = 100000, info = {}, type = "item", slot = 3,},
            [4] = {name = "yumyum", price = 10, amount = 100000, info = {}, type = "item", slot = 4,},
            [5] = {name = "icedbun", price = 10, amount = 100000, info = {}, type = "item", slot = 5,},
        },
    }
    if ShopType == 'qb' then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "LimeysSnacks", limeysSnacksShelf)
    elseif ShopType == 'jim' then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "LimeysSnacks", limeysSnacksShelf)
    elseif ShopType == 'ox' then
        exports.ox_inventory:openInventory('shop', { type = 'LimeysSnacks' })
    end
end)





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



--billing
RegisterNetEvent("lusty94_limeys:client:bill")
AddEventHandler("lusty94_limeys:bill", function()
        if onDuty then
            local bill = exports['qb-input']:ShowInput({
                header = "Create Invoice",
                submitText = "Send Invoice",
                inputs = {
                    {
                        text = "Server ID(#)",
                        name = "citizenid", -- name of the input should be unique otherwise it might override
                        type = "text", -- type of the input
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    },
                    {
                        text = "Total Bill Price:", -- text you want to be displayed as a place holder
                        name = "billprice", -- name of the input should be unique otherwise it might override
                        type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                        isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                    }
                    
                }
            })
            if bill ~= nil then
                if bill.citizenid == nil or bill.billprice == nil then 
                    return 
                end
                TriggerServerEvent("lusty94_limeys:server:bill:player", bill.citizenid, bill.billprice)
            end
        else
            SendNotify("You must be on duty to proceed!", 'error', 2500)
        end
end)


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
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Limeys V2.0.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)




--THIS CLEARS THE MLO OF PEDS FROM THE CENTRE OF THE MLO AT A RADIUS OF 20.0 AS SOMETIMES PED SPAWN INSIDE THE BUILDING AND KEEP TRYING TO GO THROUGH WALLS
-- OLD METHOD USE IF YOU WANT TO INSTEAD OF ON RESOURCE START ABOVE - THIS WILL RUN AND CLEAR PEDS FROM THE AREA EVERY SECOND, INCREASE AS YOU SEE FIT
CreateThread(function()
    while true do
        Wait(1000)
        ClearAreaOfPeds(257.95, -1022.84, 29.31, 20.0, true) -- if changing MLO locations then might need to change this or remove it completely
    end
end) 


  