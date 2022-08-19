Config = {
    LockingRange = 5.0,
    CycleVehicleClass = 13,
    Keyitem = "carkey",
    Locale = 'de',
    KeyPrice = 100,
    Locales = {
        ['en'] = {
            ['lock_vehicle'] = 'Vehicle locked',
            ['unlock_vehicle'] = 'Vehicle unlocked',
            ['plate'] = 'Plate',
            ['open_keyshop'] = 'Open keyshop',
            ['shop_title'] = 'Keyshop',
            ['not_your_vehicle'] = 'This is not your vehicle',
            ['bought_key'] = 'You bought a key for your vehicle',
            ['not_enough_money'] = 'You do not have enough money',
            ['buy_key'] = 'Do you want to buy a key for your vehicle?',
            ['yes'] = 'Yes',
            ['no'] = 'No'
        },
        ['de'] = {
            ['lock_vehicle'] = 'Fahrzeug abgeschlossen',
            ['unlock_vehicle'] = 'Fahrzeug aufgeschlossen',
            ['plate'] = 'Kennzeichen',
            ['open_keyshop'] = 'Autoschlüsselladen öffnen',
            ['shop_title'] = 'Autoschlüsselladen',
            ['not_your_vehicle'] = 'Dies ist nicht dein Fahrzeug',
            ['bought_key'] = 'Du hast einen Schlüssel für dein Fahrzeug gekauft',
            ['not_enough_money'] = 'Du hast nicht genug Geld',
            ['buy_key'] = 'Möchtest du einen Schlüssel für dein Fahrzeug kaufen?',
            ['yes'] = 'Ja',
            ['no'] = 'Nein'
        }
    },
    Notification = function(message)
        ESX.ShowNotification(message)
    end,
    KeyShop = {
        Ped = {
            Model = 'a_m_m_business_01',
            Position = vector4(170.0408, -1799.5764, 28.3159, 322.9936)
        }
    }
}

Lang = Config.Locales[Config.Locale]