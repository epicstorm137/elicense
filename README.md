# ELicense
Epicstorm's Simple Driving License Addon

NOTE: Requires ULX to use the 'ulx addlicense', 'ulx removelicense' and 'ulx printlicense' command!

Features:
- Uses ULX for permissions to the ulx addlicense, removelicense and printlicense command
- Logs the players name when they initially got their license
- Precaches if they have a license or not when they connect, to reduce lag
- Config in the "sh_edlloader.lua" file
- Ability to edit driving license price and whitelist cars to work with the license addon


Instructions:

1) Download File
2) Place in Addons folder of Garry's Mod
3) Load Server and test addon!!!

How it works:

1) After connecting, your license status will be precached and that will show up whether you have a license or not
2) When entering a car, it will check the cache whether you have a license or not.
3) If you do not have a license, it will kick you out the car.
