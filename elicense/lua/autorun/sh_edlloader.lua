edl = edl or {}
edl.Config = edl.Config or {}

-- Message that gets displayed in chat when someone does not have a driving license and attempts to enter a vehicle
edl.Config.ErrorLicenseMessage = "Error, you do not own a driving license!"

-- Price to purchase a license
edl.Config.LicensePrice = 1000

-- Prefix for chat messages, make sure to add a space after
edl.Config.ChatPrefix = "[ELicense] "

-- Text that is displayed above a License NPC
edl.Config.NPCText = "Driving License"

-- This is the default model that will be used when you spawn a License NPC in.
edl.Config.DefaultNPCModel = "models/odessa.mdl"

-- This is how far the text above the NPC will render, 2000 is default.
edl.Config.RenderDistance = 2000

-- Whitelisted cars that will not allow you to enter without a license
edl.Config.WhitelistedCars = {
    ["prop_vehicle_jeep"] = true,
    ["prop_vehicle_airboat"] = true,
}