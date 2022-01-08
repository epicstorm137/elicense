edl = edl or {}
edl.Config = edl.Config or {}

-- Message that gets displayed in chat when someone does not have a driving license and attempts to enter a vehicle
edl.Config.ErrorLicenseMessage = "Error, you do not own a driving license!"

-- Price to purchase a license
edl.Config.LicensePrice = 1000

-- Prefix for chat messages, make sure to add a space after
edl.Config.ChatPrefix = "[ELicense] "

-- Add cars to this to make it so the license works on these cars
edl.Config.WhitelistedCars = {
    ["prop_vehicle_jeep"] = true,
    ["prop_vehicle_airboat"] = true,
}