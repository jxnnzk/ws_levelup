local ESX = nil

if WS.EsxExport then
    ESX = exports["es_extended"]:getSharedObject()
else
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
end

ESX.RegisterUsableItem(WS.VisumItem, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    xPlayer.removeInventoryItem(WS.VisumItem, 1)

    local currentLevel = exports["ws_visum-v2"]:GetVisum(source) or 0
    local newLevel = currentLevel + 1

    exports["ws_visum-v2"]:SetVisum(source, newLevel, true)
end)
