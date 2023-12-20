ESX = exports["es_extended"]:getSharedObject()

RegisterCommand(wx.Command, function(source, args, rawcmd)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not wx.AdminGroups[xPlayer.getGroup()] then return end
    local target = args[1] or source
    TriggerClientEvent("wx_pedmenu:open", target)
end,false)
