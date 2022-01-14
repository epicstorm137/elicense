include("shared.lua")

function ENT:Draw()

	self:DrawModel()

	local plypos, plyang = LocalPlayer():GetPos(), LocalPlayer():GetAngles()
	local mins, maxs = self:GetModelBounds()
	local pos = self:GetPos() + Vector( 0, 0, maxs.z + 7 )
	local ang = Angle( 0, plyang.yaw-90, 90 )
	local dist = pos:Distance(plypos)
	local alpha = math.Clamp(edl.Config.RenderDistance - dist * 2.7, 0, 255)

	if (alpha <= 0) then return end

	cam.Start3D2D( pos, ang, 0.025 )
		draw.WordBox(48,0,0,edl.Config.NPCText,"EDLFont",edl.blackhud,edl.white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	cam.End3D2D()

end

net.Receive("edl_openmenu",function()
	edl.OpenMenu()
end)