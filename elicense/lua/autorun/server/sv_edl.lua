util.AddNetworkString("edl_plyready")
util.AddNetworkString("edl_plymsg")
util.AddNetworkString("edl_purchaselicense")

local plymeta = FindMetaTable("Player")

function edl.CreateTable()
    sql.Query("CREATE TABLE IF NOT EXISTS elicense ( 'SteamID' TEXT, 'data' TEXT );")
end

edl.CreateTable()

function plymeta:EDLMessage(str)
    net.Start("edl_plymsg")
    net.WriteString(str)
    net.Send(self)
end

function plymeta:HasLicense()
    return self:GetNWBool("edl:haslicense",false)
end

function plymeta:GetLicense()
    local query = sql.Query("SELECT * FROM elicense WHERE SteamID = "..SQLStr(self:SteamID())..";")

    if (query) then
        return true
    else
        return false
    end
end

function plymeta:AddLicense()
    self:SetNWBool("edl:haslicense",true)
    if self:GetLicense() then return end

    local data = {
        ["Date"] = os.date("%H:%M:%S - %d/%m/%Y"),
        ["Name"] = self:Nick(),
    }
    sql.Query("INSERT INTO elicense (SteamID,data) VALUES("..sql.SQLStr(self:SteamID())..", "..sql.SQLStr(util.TableToJSON(data)) ..");")
end

function plymeta:RemoveLicense()
    self:SetNWBool("edl:haslicense",false)
    local query = sql.Query("SELECT * FROM elicense WHERE SteamID = "..SQLStr(self:SteamID())..";")

    if (query) then
        sql.Query("DELETE FROM elicense WHERE SteamID = ".. SQLStr(self:SteamID()) ..";")
    end
end

function plymeta:GetLicenseData()
    local query = sql.QueryValue("SELECT data FROM elicense WHERE SteamID = "..SQLStr(self:SteamID())..";")
    query = util.JSONToTable(query)
    return query
end


net.Receive("edl_plyready",function(len,ply)
    if ply:GetLicense() then
        ply:SetNWBool("edl:haslicense",true)
    end
end)

net.Receive("edl_purchaselicense",function(len,ply)
    if ply:HasLicense() then return end
    if !ply:canAfford(edl.Config.LicensePrice) then return end
    
    ply:addMoney(-edl.Config.LicensePrice)
    ply:AddLicense()
    ply:EDLMessage("Purchase successful, you now own a driving license!")
end)

hook.Add("PlayerEnteredVehicle","edl:checklicense",function(ply,veh,role)
    if !edl.Config.WhitelistedCars[veh:GetClass()] then return end
    if !ply:HasLicense() then
        ply:EDLMessage(edl.Config.ErrorLicenseMessage)
        ply:ExitVehicle()
    end
end)