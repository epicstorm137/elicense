edl.bgdark     = Color(47,54,64)
edl.bglight    = Color(68,76,92)
edl.grey       = Color(150,150,150)
edl.hghlight   = Color(141,141,190)
edl.white      = Color(255,255,255)
edl.blackhud   = Color(20,20,20,253)
edl.green      = Color(94,214,94)
edl.red        = Color(204,117,117)
edl.blue       = Color(110,117,212)
edl.orange     = Color(214,139,64)
edl.wfgreen    = Color(0,255,0)
edl.rfgreen    = Color(0,255,0,50)

local PNL = FindMetaTable("Panel")

surface.CreateFont("EDLFont",{font = "Roboto",size = 255, antialias = true})
surface.CreateFont("EDLFontUI",{font = "Roboto",size = 20, antialias = true})
surface.CreateFont("EDLFontUISmall",{font = "Roboto",size = 15, antialias = true})

function edl.MakeFrame(pnl,txt,width,height)
    pnl:SetTitle("")
    pnl.IsMoving = true
    pnl:SizeTo(width,height,1,0,.1,function()
        pnl.IsMoving = false
    end)
    pnl.Paint = function(s,w,h)
        if pnl.IsMoving == true then
            pnl:Center()
        end
        surface.SetDrawColor(edl.bgdark)
        surface.DrawRect(0,0,w,h)
        draw.SimpleText(txt,"EDLFontUISmall",10,7,edl.white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
    end
end

function edl.CloseFrame(pnl)
    pnl.IsMoving = true
    pnl:SizeTo(0,0,1,0,.1,function()
        pnl:Close()
    end)
    pnl:SetMouseInputEnabled(false)
    pnl:SetKeyboardInputEnabled(false)
end

function edl.MakeButton(pnl,txt,col)
    pnl:SetText("")
    local speed,barstatus = 4,0
    pnl.Paint = function(s,w,h)
        if pnl:IsHovered() then
            barstatus = math.Clamp(barstatus + speed * FrameTime(), 0, 1)
        else
            barstatus = math.Clamp(barstatus - speed * FrameTime(), 0, 1)
        end
        surface.SetDrawColor(edl.bglight)
        surface.DrawRect(0,0,w,h)
        surface.SetDrawColor(col)
        surface.DrawRect(0,h * .9,w * barstatus,h * .1)
        draw.SimpleText(txt,"EDLFontUI",w/2,h/2,col,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end
end
    
function edl.MakeInput(pnl,txt)
    pnl:SetFont("EDLFontUISmall")
    pnl.Paint = function(s,w,h)
        surface.SetDrawColor(edl.bglight)
        surface.DrawRect(0,0,w,h)
        if pnl:GetText() == "" then
            draw.SimpleText(txt,"EDLFontUISmall",5,h/2,edl.grey,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
        pnl:DrawTextEntryText(edl.white,edl.hghlight,edl.white)
    end
end
    
function edl.MakeCombo(pnl,txt)
    pnl:SetFont("EDLFontUISmall")
    pnl:SetColor(edl.white)
    pnl.Paint = function(s,w,h)
        surface.SetDrawColor(edl.bglight)
        surface.DrawRect(0,0,w,h)
        if pnl:GetSelected() == nil and pnl:GetText() == "" then
            draw.SimpleText(txt,"EDLFontUISmall",5,h/2,edl.grey,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
        end
    end
end

function edl.MakeList(pnl)
    pnl.Paint = function(s,w,h)
        surface.SetDrawColor(edl.bglight)
        surface.DrawRect(0,0,w,h)
    end
end