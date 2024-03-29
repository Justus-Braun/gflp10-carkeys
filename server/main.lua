
local function AddCarkey(source, plate, model)
    exports.ox_inventory:AddItem(source, Config.Keyitem, 1, { plate = plate, model = model })
end
exports('AddCarkey', AddCarkey)

local function RemoveCarkey(source, plate, model)
    exports.ox_inventory:RemoveItem(source, Config.Keyitem, 1, { plate = plate, model = model })
end
exports('RemoveCarkey', RemoveCarkey)

lib.callback.register('carkeys:callback:getPlayerVehicles', function(source, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local vehicles = {}
    local result = MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = ?', { xPlayer.identifier })
    if result then
        for k, v in pairs(result) do
            local vehicle = json.decode(v.vehicle)
            vehicles[#vehicles + 1] = {
                plate = vehicle.plate,
                model = vehicle.model
            }
        end
        return vehicles
    end
    return false        
end)

RegisterNetEvent('carkeys:server:buyKey', function(plate, model)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    MySQL.single('SELECT owner FROM owned_vehicles WHERE plate = ?', { plate }, function(result)
        if result then
            if xPlayer.getMoney() >= Config.KeyPrice then
                xPlayer.removeMoney(Config.KeyPrice)
                exports['gflp10-carkeys']:AddCarkey(_source, plate, model)
                xPlayer.showNotification(Lang['bought_key'])
            else
                xPlayer.showNotification(Lang['not_enough_money'])
            end
        else
            xPlayer.showNotification(Lang['not_your_vehicle'])
        end
    end)
end)
