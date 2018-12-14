
local cfg = {}

-- city hall position
cfg.city_hall = {405.12109375,-956.91125488281,-99.009918212891,3.2416226863861}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {498,4}

-- cost of a new identity
cfg.new_identity_cost = 1000

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "DDDDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
	"Adam",
	"Agnes",
	"Aksel",
	"Albert",
	"Alberte",
	"Alexander",
	"Alfred",
	"Alma",
	"Andrea",
	"Anna",
	"Anton",
	"Arthur",
	"Asger",
	"Asta",
	"Astrid",
	"August",
	"Augusta",
	"Aya",
	"Benjamin",
	"Bertram",
	"Carl",
	"Caroline",
	"Christian",
	"Clara",
	"Elias",
	"Ella",
	"Ellen",
	"Ellie",
	"Elliot",
	"Emil",
	"Emilie",
	"Emily",
	"Emma",
	"Esther",
	"Felix",
	"Filippa",
	"Frederik",
	"Freja",
	"Frida",
	"Ida",
	"Isabella",
	"Jakob",
	"Jeff",
	"Johan",
	"Johanne",
	"Josefine",
	"Karla",
	"Konrad",
	"Lauge",
	"Laura",
	"Laurits",
	"Lea",
	"Liam",
	"Lily",
	"Liv",
	"Liva",
	"Louie",
	"Lucas",
	"Luna",
	"Lærke",
	"Mads",
	"Magne",
	"Magnus",
	"Maja",
	"Malthe",
	"Marcus",
	"Marie",
	"Marius",
	"Mathias",
	"Mathilde",
	"Mikkel",
	"Mille",
	"Naja",
	"Nanna",
	"Noah",
	"Nohr",
	"Nora",
	"Oliver",
	"Olivia",
	"Oscar",
	"Otto",
	"Philip",
	"Rosa",
	"Saga",
	"Sara",
	"Sebastian",
	"Signe",
	"Sofia",
	"Sofie",
	"Storm",
	"Theo",
	"Theodor",
	"Thor",
	"Tilde",
	"Valdemar",
	"Victor",
	"Victoria",
	"Vigga",
	"Viggo",
	"Villads",
	"William"
}

cfg.random_last_names = {
	"Andersen",
	"Christensen",
	"Christiansen",
	"Hansen",
	"Jensen",
	"Johansen",
	"Jørgensen",
	"Knudsen",
	"Kristensen",
	"Larsen",
	"Madsen",
	"Møller",
	"Nielsen",
	"Olsen",
	"Pedersen",
	"Petersen",
	"Poulsen",
	"Rasmussen",
	"Sørensen",
	"Thomsen"
}

return cfg
