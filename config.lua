Config = {}

Config.NotifyPolice = true -- Notify Police when someone is robbing? Default true.

Config.CashRegCops = 1 --Number of police needed on duty before robbing cash registers
Config.SafeCops = 2 --Number of police needed on duty before robbing Safes (Back Rooms)
Config.VaultCops = 4 --Number of police needed on duty before robbing vaults

Config.Cameras = false --If you are using st-cctv to notify police of robbery. Only Works if Config.NotifyPolice = true. Default false. If set to true wh-outlawalert will alert of a camera being triggered if false wh-outlawalert will notify of robbery at said store.

Config.Control = 48 -- Button to press to rob a location (Remember to change the 3d text in client.lua) Default 48 (z).

Config.EnableCashReg = true --Enable robbing of the cash registers? Default true.
Config.EnableSafe = true --Enable robbing of the safes? Default true.
Config.EnableVault = true --Enable robbing of the safes? Default true.

Config.EnableCooldown = true --Enables cooldown between each robbery location.

Config.CashRegCooldown = 3000 --Cooldown Time (seconds) for cash registers.
Config.SafeCooldown = 3000 --Cooldown Time (seconds) for Safes.
Config.VaultCooldown = 3000 --Cooldown Time (seconds) for Vaults.

--Cash Register Win Amounts
Config.CashRegMin = 50
Config.CashRegMax = 1000

--Safe Win Amounts (Backrooms)
Config.SafeMin = 1000
Config.SafeMax = 10000

--Vault Win Amounts
Config.VaultMin = 15000
Config.VaultMax = 100000

Config.CashRegTimer = 2000 --Cooldown Timer for cash registers in seconds
Config.SafeTimer = 3000 --Cooldown Timer for Safes (Back Rooms) in seconds
Config.VaultTimer = 5000 --Cooldown Timer for vaults in seconds


-- Cash Register Rob Locations (x, y, z). Cam - Camera Number that gets triggered (Don't worry if Config.Cameras = false). Name - Location name of robbery location (Has no purpose other than telling police where it is). 
Config.CashRegLocations = {
	[1] = {x = 2676.0,   y = 3280.58,  z = 54.24, name = "24/7 Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[2] = {x = 2678.03,   y = 3279.42,  z = 54.24, name = "24/7 Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[3] = {x = 1728.7,   y = 6417.45,  z = 34.04, name = "Paleto 24/7 - 3030", cam = 18, lastRobbed = 0},
	[4] = {x = 1727.58,   y = 6415.38,  z = 34.04, name = "Paleto 24/7 - 3030", cam = 18, lastRobbed = 0},
	[5] = {x = 1164.88,   y = -322.72,  z = 68.21, name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0},
	[6] = {x = 1165.05,   y = -324.45,  z = 68.21, name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0},
	[7] = {x = -1820.45,   y = -793.77,  z = 138.09, name = "LTD Route 11 - 817", cam = 7, lastRobbed = 0}
}

Config.SafeLocations = {
	[1] = {x = 2672.76,   y = 3286.61,  z = 54.24, name = "24/7 Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[2] = {x = 1734.9,   y = 6420.86,  z = 34.04, name = "Paleto 24/7 - 3030", cam = 18, lastRobbed = 0},
	[3] = {x = 1159.22,   y = -314.0,  z = 68.21, name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0}

Config.VaultLocations = {
	[1] = {x = 253.8,   y = 228.26,  z = 100.68, name = "Pacific Standard Vault - 575", cam = 25, lastRobbed = 0} --This one requires an extra camera if you are using them: '[25] =  { ['x'] = 252.41,['y'] = 225.44,['z'] = 102.88,['h'] = 289.79, ['info'] = ' Cam PS Vault' },'
}
