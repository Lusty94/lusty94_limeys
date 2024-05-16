local QBCore = exports['qb-core']:GetCoreObject()
local ShopType = Config.CoreSettings.Shop.Type
local InvType = Config.CoreSettings.Inventory.Type
local TargetType = Config.CoreSettings.Target.Type
local NotifyType = Config.CoreSettings.Notify.Type
local onDuty, busy = false, false
PlayerJob = {}


--notification function
local function SendNotify(msg,type,time,title)
    if NotifyType == nil then print("Lusty94_Limeys: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = "Notification" end
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
                    busy = true
                    LockInventory(true)
                    QBCore.Functions.Progressbar("mango_smoothie", "Preparing Mango Smoothie", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_parking_meter@female@base",
                        anim = "base_female",
                        flags = 41,
                    }, {}, {}, function()
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lusty94_limeys:server:CreateMangoSmoothie')
                        SendNotify("Mango Smoothie Prepared!", 'success', 2500)
                    end, function()
                        busy = false
                        LockInventory(false)
                        ClearPedTasks(PlayerPedId())
                        SendNotify("Action cancelled!", 'error', 2500)
                    end)
                end
            else
                SendNotify("You Are Missing Items!", 'error', 2500)
            end
        end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("peach_smoothie", "Preparing Peach Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreatePeachSmoothie')
                            SendNotify("Peach Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("lychee_smoothie", "Preparing Lychee Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateLycheeSmoothie')
                            SendNotify("Lychee Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("pineapple_smoothie", "Preparing Pineapple Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreatePineappleSmoothie')
                            SendNotify("Pineapple Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("coconut_smoothie", "Preparing Coconut Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateCoconutSmoothie')
                            SendNotify("Coconut Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("strawberry_smoothie", "Preparing Strawberry Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateStrawberrySmoothie')
                            SendNotify("Strawberry Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("passionFruit_smoothie", "Preparing Passion Fruit Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreatePassionFruitSmoothie')
                            SendNotify("Passion Fruit Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("lemon_smoothie", "Preparing Lemon Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateLemonSmoothie')
                            SendNotify("Lemon Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("almond_smoothie", "Preparing Almond Smoothie", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateAlmondSmoothie')
                            SendNotify("Almond Smoothie Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("prepare_tea", "Preparing Cup of Tea", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateTea')
                            SendNotify("Cup of Tea Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("prepare_coffee", "Preparing Cup of Coffee", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateCoffee')
                            SendNotify("Cup of Coffee Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
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
                        busy = true
                        LockInventory(true)
                        QBCore.Functions.Progressbar("prepare_hotchocolate", "Preparing Cup of Hot Chocolate", 10000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "amb@prop_human_parking_meter@female@base",
                            anim = "base_female",
                            flags = 41,
                        }, {}, {}, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            TriggerServerEvent('lusty94_limeys:server:CreateHotChocolate')
                            SendNotify("Hot Chocolate Prepared!", 'success', 2500)
                        end, function()
                            busy = false
                            LockInventory(false)
                            ClearPedTasks(PlayerPedId())
                            SendNotify("Action cancelled!", 'error', 2500)
                        end)
                    end
                else
                    SendNotify("You Are Missing Items!", 'error', 2500)
                end
            end)
    else 
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
    end
end) 





--collection tray
RegisterNetEvent("lusty94_limeys:client:OpenCollectionTray", function()
    if InvType == 'qb' then
        TriggerEvent("inventory:client:SetCurrentStash", "collectiontray")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "collectiontray", {
            maxweight = Config.InteractionLocations.CollectionTray.StashSize,
            slots = Config.InteractionLocations.CollectionTray.StashSlots,
        })
    elseif InvType == 'ox' then
        exports.ox_inventory:openInventory('stash', 'limeyscollectiontray') -- if changing stash name in ox make sure you change it here too
    end
end)




--storage fridge
RegisterNetEvent("lusty94_limeys:client:OpenStorageFridge", function()
    if onDuty then
        if InvType == 'qb' then
            TriggerEvent("inventory:client:SetCurrentStash", "limeysdrinksfridge")
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "limeysdrinksfridge", {
                maxweight = Config.InteractionLocations.Storage.Fridge.StashSize,
                slots = Config.InteractionLocations.Storage.Fridge.StashSlots,
            })
        elseif InvType == 'ox' then
            exports.ox_inventory:openInventory('stash', 'limeysstoragefridge') -- if changing stash name in ox make sure you change it here too
        end
    else
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
    end
end)

--ingredients tray
AddEventHandler("lusty94_limeys:client:IngredientsTray", function()
    if onDuty then
        if ShopType == 'qb'then
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "LimeysIngredients", Config.InteractionLocations.Ingredients.Items)
        elseif ShopType == 'jim' then
            TriggerServerEvent("jim-shops:ShopOpen", "shop", "LimeysIngredients", Config.InteractionLocations.Ingredients.Items)
        elseif ShopType == 'ox' then
            exports.ox_inventory:openInventory('shop', { type = 'LimeysIngredients' }) -- if changing shop name in ox make sure you change it here too
        end
    else
        SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
    end
end)

--snack shelf {doesnt go to society}
AddEventHandler("lusty94_limeys:client:SnackShelf", function()
    if ShopType == 'qb' then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "LimeysSnacks", Config.InteractionLocations.SnackShelf.Items)
    elseif ShopType == 'jim' then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "LimeysSnacks", Config.InteractionLocations.SnackShelf.Items)
    elseif ShopType == 'ox' then
        exports.ox_inventory:openInventory('shop', { type = 'LimeysSnacks' }) -- if changing shop name in ox make sure you change it here too
    end
end)

-- smoothie cup input
RegisterNetEvent('lusty94_limeys:client:GiveSmoothieCup', function(data) 
    local dialog = exports['qb-input']:ShowInput({
        header = "How Many Do You Want?",
        submitText = "Confirm",
        inputs = {
            {
                text = "Amount", -- text you want to be displayed as a place holder
                name = "amount", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog then
        TriggerServerEvent('lusty94_limeys:server:GiveSmoothieCup', tonumber(dialog["amount"]))
    end
end)

--coffee cup input
RegisterNetEvent('lusty94_limeys:client:GiveCoffeeCup', function(data) 
    local dialog = exports['qb-input']:ShowInput({
        header = "How Many Do You Want?",
        submitText = "Confirm",
        inputs = {
            {
                text = "Amount", -- text you want to be displayed as a place holder
                name = "amount", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
        },
    })
    if dialog then
        TriggerServerEvent('lusty94_limeys:server:GiveCoffeeCup', tonumber(dialog["amount"]))
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
                        text = "Total Bill Price: "..Config.InteractionLocations.Payment.CashSymbol, -- text you want to be displayed as a place holder
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
            SendNotify("You Must Be Clocked In To Do That!", 'error', 2500)
        end
end)


-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        if InvType == 'qb' then
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end
    else 
        if InvType == 'qb' then
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end
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
        if TargetType == 'qb' then
            exports['qb-target']:RemoveZone("DutyZone")
            exports['qb-target']:RemoveZone("BossMenuZone")
            exports['qb-target']:RemoveZone("PaymentZone")
            exports['qb-target']:RemoveZone("CollectionTrayZone")
            exports['qb-target']:RemoveZone("SmoothieMachineZone")
            exports['qb-target']:RemoveZone("HotDrinksMachineZone")
            exports['qb-target']:RemoveZone("StorageFridgeZone")
            exports['qb-target']:RemoveZone("IngredientsTrayZone")
            exports['qb-target']:RemoveZone("SnackShelfZone")
        elseif TargetType == 'ox' then
            exports.ox_target:removeZone(1)
            exports.ox_target:removeZone(2)
            exports.ox_target:removeZone(3)
            exports.ox_target:removeZone(4)
            exports.ox_target:removeZone(5)
            exports.ox_target:removeZone(6)
            exports.ox_target:removeZone(7)
            exports.ox_target:removeZone(8)
            exports.ox_target:removeZone(9)
        end
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Limeys V1.2.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)


--if just wanting area cleared on resource start use this snippet

--[[ 

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        --THIS CLEARS THE MLO OF PEDS FROM THE CENTRE OF THE MLO AT A RADIUS OF 20.0 AS SOMETIMES PED SPAWN INSIDE THE BUILDING AND KEEP TRYING TO GO THROUGH WALLS
        --IF CHANGING LOCATIONS FOR MLO THEN MAKE SURE YOU REMOVE THIS IF NEEDS BE AS IT MIGHT INTERFERE WITH OTHER SCRIPTS / MLOS IN THE AREA
        ClearAreaOfPeds(257.95, -1022.84, 29.31, 20.0, true)
    end
end) 

]]

  

--if wanting area cleared every second then use this snippet

--THIS CLEARS THE MLO OF PEDS FROM THE CENTRE OF THE MLO AT A RADIUS OF 20.0 AS SOMETIMES PED SPAWN INSIDE THE BUILDING AND KEEP TRYING TO GO THROUGH WALLS
-- OLD METHOD USE IF YOU WANT TO INSTEAD OF ON RESOURCE START ABOVE - THIS WILL RUN AND CLEAR PEDS FROM THE AREA EVERY SECOND, INCREASE AS YOU SEE FIT
CreateThread(function()
    while true do
        ClearAreaOfPeds(257.95, -1022.84, 29.31, 20.0, true)
        Wait(1000)
    end
end) 


  