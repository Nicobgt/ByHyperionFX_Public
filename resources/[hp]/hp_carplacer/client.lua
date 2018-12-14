local vehicles = {
    -- Fotovogne
    {Model= "burrito3", X= -453.00729370117, Y= -144.88781738281, Z= 37.048791503906, A= 27.267488479614},
    {Model= "burrito3", X= 343.28149414063, Y= -741.33166503906, Z= 28.22426376343, A= 341.26953125},
    {Model= "burrito3", X= 583.68109130859, Y= -1038.8240966797, Z= 35.892339324951, A= 276.79147338867},
    {Model= "burrito3", X= 1159.4560546875, Y= 603.40740966797, Z= 97.600476074219, A= 143.62663269043},
    {Model= "burrito3", X= 2419.0642089844, Y= 3944.5319824219, Z= 35.251952362061, A= 315.15115356445},
    {Model= "burrito3", X= -196.72119140625, Y= 6163.0190429688, Z= 30.325545883179, A= 314.62280273438},
    {Model= "burrito3", X= 1667.8442382813, Y= 1360.7210693359, Z= 86.216006469727, A= 169.68803405762},
    {Model= "burrito3", X= 2234.185546875, Y= 2738.4643554688, Z= 44.230134735107, A= 297.9485168457},
    -- Bilshoppen
    {Model= "w222wald", X= -1149.2967529297, Y= -1732.7222900391, Z= 3.5529190864563, A= 346.29260253906},
    {Model= "baller4", X= -1146.060546875, Y= -1735.8446044922, Z= 3.6129190864563, A= 344.67150878906},
    {Model= "dominator3", X= -1141.7109375, Y= -1734.8432617188, Z= 3.5129190864563, A= 345.08264160156},
    {Model= "ghibli", X= -1149.4034423828, Y= -1722.4375, Z= 3.5429190864563, A= 247.04473876953},
    {Model= "mst", X= -1153.5639648438, Y= -1725.0151367188, Z= 3.7129190864563, A= 215.63671875},
    {Model= "avarus", X= -1131.3181152344, Y= -1728.9016113281, Z= 4.0015135383606, A= 242.90046691895},
    {Model= "hexer", X= -1130.9896240234, Y= -1727.8734130859, Z= 4.0019610404968, A= 251.11273193359},
    {Model= "bati", X= -1132.5285644531, Y= -1726.1605224609, Z= 3.7607743186951, A= 86.638397216797},
    {Model= "carbonrs", X= -1132.8087158203, Y= -1725.0947265625, Z= 3.7362818527222, A= 120.43079376221},
    {Model= "faggio3", X= -1135.5637207031, Y= -1723.6923828125, Z= 3.9520242881775, A= 131.19212341309},
    {Model= "faggio", X= -1136.2901611328, Y= -1722.6986083984, Z= 3.9502862167358, A= 128.03077697754},

}

RegisterNetEvent("hp_carplacer:place")
AddEventHandler("hp_carplacer:place", function()
    for _, item in pairs(vehicles) do
        RequestModel(GetHashKey(item.Model));
        while not HasModelLoaded(GetHashKey(item.Model)) do
            RequestModel(GetHashKey(item.Model));
            Wait(1)
        end
        local vehicle = CreateVehicle(GetHashKey(item.Model), item.X, item.Y, item.Z, item.A, false, false)
        FreezeEntityPosition(vehicle,true)
    end
end)