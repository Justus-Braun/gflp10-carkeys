## gflp10-carkeys

This ressource can be used to lock and unlock vehicles
Start this script before ox_inventory or it could cause problems


### Setup
Required 
- ox_inventory
- ox_lib

Add the item carkey to ox_inventory/data/items.lua
```lua
['carkey'] = {
		label = 'Carkey',
		weight = 300,
		stack = false
},
```

Add this to ox_inventory/modules/items/client.lua
```lua
Item('carkey', function(data, slot)
	TriggerEvent('carkeys:client:useKey', slot)
end)
```
 
If you want to add keys to a Inventory use the export AddCarkey on Serverside
```lua
local playerId = 1
local plate = "ABC 123"
exports['gflp10-carkeys']:AddCarkey(playerId, plate)
```
