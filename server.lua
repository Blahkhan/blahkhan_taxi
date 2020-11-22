ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("blahkhan_taxi:process")
AddEventHandler("blahkhan_taxi:process", function(Player, mess, loc)
  for _, playerId in ipairs(GetPlayers()) do
    local p = ESX.GetPlayerFromId(playerId)
    if p.job.name == 'taxi' then
      TriggerClientEvent('blahkhan_taxi:show_mess', playerId, mess, loc)
    end
  end
end)
