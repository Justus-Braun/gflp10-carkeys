CreateThread(function()
    while GetResourceState('ox_inventory') ~= 'started' do
        Wait(100)
    end
    local Inventory = exports.ox_inventory
    Inventory:displayMetadata('plate', Lang['plate'])
end)

CreateThread(function()
    while GetResourceState('ox_target') ~= 'started' do
        Wait(100)
    end

    local pedHash = GetHashKey(Config.KeyShop.Ped.Model)

    RequestModel(pedHash)                      
    while not HasModelLoaded(pedHash) do Wait(1) end

    local ped = CreatePed(4, pedHash, Config.KeyShop.Ped.Position, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports.ox_target:addModel(Config.KeyShop.Ped.Model, {
        {
            icon = 'fas fa-key',
            label = Lang['open_keyshop'],
            onSelect = function()
				OpenKeyShop()
			end,
        }
    })
end)

CreateThread(function()
    local blip = AddBlipForCoord(Config.KeyShop.Ped.Position)
    SetBlipSprite(blip, 811)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Lang['shop_title'])
    EndTextCommandSetBlipName(blip)
end)

AddEventHandler('carkeys:client:useKey', function(data)
    local plate = data.metadata.plate
    local ped = PlayerPedId()

    while #plate < 8 do
        plate = plate .. ' '
    end

    local vehicle = GetVehicleInDistanceByPlate(plate, Config.LockingRange)
    if vehicle then
        ToggleVehicleLock(vehicle)
    end

end)

AddEventHandler('carkeys:context:yesno', function(data)
    lib.hideContext(false)
    lib.registerContext({
        id = 'carkeys_yesno_menu',
        title = Lang['buy_key'],
        options = {
            {
                title = Lang['yes'],
                event = 'carkeys:client:buyKey',
                args = {
                    plate = data.plate
                }
            },
            {
                title = Lang['no'],
                menu = 'carkeys_context_shop'
            }
        }
    })
    lib.showContext('carkeys_yesno_menu')
end)

AddEventHandler('carkeys:client:buyKey', function(data)
    TriggerServerEvent('carkeys:server:buyKey', data.plate)
end)