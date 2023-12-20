local isShown = false
local availablepeds = {}

Citizen.CreateThread(function ()
    for _, ped in pairs(wx.Peds) do
        table.insert(availablepeds,
            { value = ped, label = ped }
        )
    end
end)

function SetPed(ped)
    local player = PlayerPedId()
    RequestModel(ped)
    while not HasModelLoaded(ped) do
        RequestModel(ped)
        Wait(10)
    end
    Wait(200)
    wx.PedFunction(ped)
    SetPlayerModel(player, ped)
    lib.notify({title = 'Ped Menu', description = 'You have changed your Ped model to '..tostring(ped), type = 'success', icon="person"})
end
RegisterNetEvent("wx_pedmenu:open")
AddEventHandler("wx_pedmenu:open", function()
    local pedmenu = lib.inputDialog("Choose your PED", {
        {
            type = 'select',
            label = "Ped Model",
            icon = "person",
            options = availablepeds
        },
    })
    SetPed(pedmenu[1])
    
end)

TriggerEvent('chat:addSuggestion', '/pedmenu', '[ADMINS ONLY] Opens the ped menu for another player or for yourself', {
    { name="PLAYER", help="Player ID" },
})