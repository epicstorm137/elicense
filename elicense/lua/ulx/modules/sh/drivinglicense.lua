local CATEGORY_NAME = "Driving License"

function ulx.addlicense( calling_ply, target_ply )
	target_ply:AddLicense()

	ulx.fancyLogAdmin( calling_ply, "#A gave a license to #T", target_ply )
end
local addlicense = ulx.command( CATEGORY_NAME, "ulx addlicense", ulx.addlicense, "!addlicense" )
addlicense:addParam{ type=ULib.cmds.PlayerArg }
addlicense:defaultAccess( ULib.ACCESS_ADMIN )
addlicense:help( "Gives a license to the target." )

function ulx.removelicense( calling_ply, target_ply )
	target_ply:RemoveLicense()

	ulx.fancyLogAdmin( calling_ply, "#A removed the license from #T", target_ply )
end
local removelicense = ulx.command( CATEGORY_NAME, "ulx removelicense", ulx.removelicense, "!removelicense" )
removelicense:addParam{ type=ULib.cmds.PlayerArg }
removelicense:defaultAccess( ULib.ACCESS_ADMIN )
removelicense:help( "Removes the license from the target." )

function ulx.printlicensedata( calling_ply, target_ply )
	local data = target_ply:GetLicenseData()
	calling_ply:EDLMessage("License Name: "..data.Name.." Date of creation: "..data.Date)
end
local printlicense = ulx.command( CATEGORY_NAME, "ulx printlicense", ulx.printlicensedata, "!printlicense" )
printlicense:addParam{ type=ULib.cmds.PlayerArg }
printlicense:defaultAccess( ULib.ACCESS_ADMIN )
printlicense:help( "Prints the license data for the target." )
