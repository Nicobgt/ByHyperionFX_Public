local cfg = {}

-- define customization parts
local parts = {
	-- ["Ansigt"] = 0,
	-- ["Hår"] = 2,
	["Masker"] = 1,
	["Hænder/Arme"] = 3,
	["Bukser"] = 4,
	["Tasker"] = 5,
	["Sko"] = 6,
	["Hals"] = 7,
	["Undertrøje"] = 8,
	["Veste"] = 9,
	-- ["Mærker"] = 10,
	["Overtøj"] = 11,
	["Hatte"] = "p0",
	["Briller"] = "p1",
	["Ører"] = "p2",
	["Ure"] = "p6"
}
local parts_ped = {
	["Ansigt"] = 0,
	["Hår"] = 2,
	["Masker"] = 1,
	["Hænder/Arme"] = 3,
	["Bukser"] = 4,
	["Tasker"] = 5,
	["Sko"] = 6,
	["Hals"] = 7,
	["Undertrøje"] = 8,
	["Veste"] = 9,
    ["Mærker"] = 10,
	["Overtøj"] = 11,
	["Hatte"] = "p0",
	["Briller"] = "p1",
	["Ører"] = "p2",
	["Ure"] = "p6"
}


-- changes prices (any change to the character parts add amount to the total price)
cfg.drawable_change_price = 20
cfg.texture_change_price = 5

-- skinshops list {parts,x,y,z,hidden}
cfg.skinshops = {
	{parts,72.2545394897461,-1399.10229492188,29.3761386871338,false},
	{parts,-703.77685546875,-152.258544921875,37.4151458740234,false},
	{parts,-167.863754272461,-298.969482421875,39.7332878112793,false},
	{parts,428.694885253906,-800.1064453125,29.4911422729492,false},
	{parts,-829.413269042969,-1073.71032714844,11.3281078338623,false},
	{parts,-1193.42956542969,-772.262329101563,17.3244285583496,false},
	{parts,-1447.7978515625,-242.461242675781,49.8207931518555,false},
	{parts,11.6323690414429,6514.224609375,31.8778476715088,false},
	{parts,1696.29187011719,4829.3125,42.0631141662598,false},
	{parts,123.64656829834,-219.440338134766,54.5578384399414,false},
	{parts,618.093444824219,2759.62939453125,42.0881042480469,false},
	{parts,1190.55017089844,2713.44189453125,38.2226257324219,false},
	{parts,-3172.49682617188,1048.13330078125,20.8632030487061,false},
	{parts,-1108.44177246094,2708.92358398438,19.1078643798828,false},
	{parts_ped,1861.5981445313,3675.9304199219,-116.78115081787,true},
	{parts_ped,449.95233154297,-990.47540283203,30.589588546753,true},
	{parts_ped,-811.86987304688,175.03428649902,76.745384216309,true},
	{parts_ped,269.67172241211,-1364.0183105469,24.537786483765,true},
	{parts_ped,-1630.4106445313,-1158.8199462891,1.6663680076599,true},
}

return cfg