hook.Add("InitPostEntity","edl:plyready",function()
    net.Start("edl_plyready")
    net.SendToServer()
end)

local plymeta = FindMetaTable("Player")

function plymeta:HasLicense()
    return self:GetNWBool("edl:haslicense",false)
end

net.Receive("edl_plymsg",function()
    chat.AddText(edl.orange,edl.Config.ChatPrefix,edl.white,net.ReadString())
end)

function edl.OpenMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(0,0)
    frame:Center()
    frame:MakePopup()
    frame:SetVisible(true)
    edl.MakeFrame(frame,"Driver's License Purchase Menu",300,200)

    local text = vgui.Create("DLabel",frame)
    text:SetPos(10,30)
    text:SetSize(300,30)
    text:SetFont("EDLFontUISmall")

    local purchase = vgui.Create("DButton",frame)
    purchase:SetPos(10,150)
    purchase:SetSize(280,40)
    if LocalPlayer():HasLicense() then
        text:SetText("You already own a license!")
        edl.MakeButton(purchase,"You already own a license!",edl.red)
    else
        text:SetText("You do not currently own a license!")
        edl.MakeButton(purchase,"Purchase License for "..DarkRP.formatMoney(edl.Config.LicensePrice),edl.green)
    end

    purchase.DoClick = function()
        if LocalPlayer():HasLicense() then
            chat.AddText(edl.orange,edl.Config.ChatPrefix,edl.white,"Error, You already own a drivers license!")
            edl.CloseFrame(frame)
            return
        end
        if LocalPlayer():canAfford(edl.Config.LicensePrice) then
            net.Start("edl_purchaselicense")
            net.SendToServer()
            edl.CloseFrame(frame)
        else
            chat.AddText(edl.orange,edl.Config.ChatPrefix,edl.white,"Error, You cannot afford this, you need "..DarkRP.formatMoney(edl.Config.LicensePrice))
        end
    end
end