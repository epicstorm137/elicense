include("shared.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

util.AddNetworkString("edl_openmenu")

function ENT:Initialize()

	self:SetModel(edl.Config.DefaultNPCModel)
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_SCRIPT)
	self:SetSolid(SOLID_BBOX)
	self:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD))
	self:SetUseType(SIMPLE_USE)
	self:DropToFloor()
	self:SetMaxYawSpeed(90)
	self:DropToFloor()

end

function ENT:Use( activator )

	if ( activator:IsPlayer() ) then

		net.Start("edl_openmenu")
		net.Send(activator)
	
	end

end