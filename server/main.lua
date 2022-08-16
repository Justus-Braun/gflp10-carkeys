local Inventory

AddEventHandler('ox_inventory:loadInventory', function(module)
    Inventory = module
end)

local function AddCarkey(source, plate)
    Inventory:AddItem(source, Config.Keyitem, 1, { plate = plate })
end
exports('addCarkey', AddCarkey)