ENT.Base = "base_ai"
ENT.Type = "ai"
ENT.PrintName = "ELicense NPC"
ENT.Author = "Epicstorm"
ENT.Category = "ELicense"
ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim
end