Config                      = {}

-- Language setting - English | Portuguese_PT | Portuguese_BR | French | German | Spanish
Config.Lang                 = "English"

Config.Webhook              = ""

Config.ItemToPanning        = "gold_pan" -- Same of DB

Config.EnableLicense        = true
Config.ItemLicenseToPanning = "gold_panning_license" -- Same of DB

-- Item receiving settings
Config.receiveItem          = 50  -- Threshold number; receive item if random number is below this
Config.chanceGettingItem    = 100 -- Chance of getting an item, as a percentage
-- List of possible items to receive
Config.items                = {
    { name = "gold_nugget", label = "Gold Nugget", amount = 1 },
    { name = "fish",        label = "Any Fish",    amount = 1 },
}

Config.locations            = { -- Wild Water Locations
    [1]  = { name = 'Sea of Coronado', hash = -247856387 },
    [2]  = { name = 'San Luis River', hash = -1504425495 },
    [3]  = { name = 'Lake Don Julio', hash = -1369817450 },
    [4]  = { name = 'Flat Iron Lake', hash = -1356490953 },
    [5]  = { name = 'Upper Montana River', hash = -1781130443 },
    [6]  = { name = 'Owanjila', hash = -1300497193 },
    [7]  = { name = 'Hawks Eye Creek', hash = -1276586360 },
    [8]  = { name = 'Little Creek River', hash = -1410384421 },
    [9]  = { name = 'Dakota River', hash = 370072007 },
    [10] = { name = 'Beartooth Beck', hash = 650214731 },
    [11] = { name = 'Lake Isabella', hash = 592454541 },
    [12] = { name = 'Cattail Pond', hash = -804804953 },
    [13] = { name = 'Deadboot Creek', hash = 1245451421 },
    [14] = { name = 'Spider Gorge', hash = -218679770 },
    [15] = { name = 'O\'Creagh\'s Run', hash = -1817904483 },
    [16] = { name = 'Moonstone Pond', hash = -811730579 },
    [17] = { name = 'Kamassa River', hash = -1229593481 },
    [18] = { name = 'Elysian Pool', hash = -105598602 },
    [19] = { name = 'Heartlands Overflow', hash = 1755369577 },
    [20] = { name = 'Lagras Bayou', hash = -557290573 },
    [21] = { name = 'Lannahechee River', hash = -2040708515 },
    [22] = { name = 'Calmut Ravine', hash = 231313522 },
    [23] = { name = 'Ringneck Creek', hash = 2005774838 },
    [24] = { name = 'Stillwater Creek', hash = -1287619521 },
    [25] = { name = 'Lower Montana River', hash = -1308233316 },
    [26] = { name = 'Aurora Basin', hash = -196675805 },
    [27] = { name = 'Barrow Lagoon', hash = 795414694 },
    [28] = { name = 'Arroyo De La Vibora', hash = -49694339 },
    [29] = { name = 'Bahia De La Paz', hash = -1168459546 },
    [30] = { name = 'Dewberry Creek', hash = 469159176 },
    [31] = { name = 'Whinyard Strait', hash = -261541730 },
    [32] = { name = 'Cairn Lake', hash = -1073312073 },
    [33] = { name = 'Hot Springs', hash = 1175365009 },
    [34] = { name = 'Mattlock Pond', hash = 301094150 },
    [35] = { name = 'Southfield Flats', hash = -823661292 },
}
