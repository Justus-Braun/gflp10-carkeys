Config = {
    LockingRange = 5.0,
    CycleVehicleClass = 13,
    Keyitem = "carkey",
    Locale = 'en',
    Locales = {
        ['en'] = {
            ['lock_vehicle'] = 'Vehicle locked',
            ['unlock_vehicle'] = 'Vehicle unlocked'
        },
        ['de'] = {
            ['lock_vehicle'] = 'Fahrzeug abgeschlossen',
            ['unlock_vehicle'] = 'Fahrzeug aufgeschlossen'
        }
    },
    Notification = function(message)
        lib.notify({description = message})
    end
}

Lang = Config.Locales[Config.Locale]