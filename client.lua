local PlayerData = {}
local locatinP = nil
local isTriggered = false
local blipMed = nil
local ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(0)
    if isTriggered == true then
      blipMed = AddBlipForRadius(locatinP.x, locatinP.y, locatinP.z, 20.0)

      SetBlipHighDetail(blip, true)
      SetBlipColour(blip, 13)
      SetBlipAlpha(blip, 250)
      SetBlipAsShortRange(blip, true)

      Wait(1000 * 10)

      RemoveBlip(blipMed)
      isTriggered = false
    end
  end
end)

RegisterCommand("taxi", function(source, args, rawCommand)
  local playerPed = GetPlayerPed(-1)
  PlayerData = ESX.GetPlayerData(GetPlayerPed(-1))
  local playerCoords = GetEntityCoords(playerPed)
  locatinP = playerCoords
  TriggerServerEvent("blahkhan_taxi:process", PlayerData, table.concat(args, " "), playerCoords)
end,false)

RegisterNetEvent('blahkhan_taxi:show_mess')
AddEventHandler('blahkhan_taxi:show_mess', function(mess, loc)
  exports['mythic_notify']:DoLongHudText('inform','Klijent wysyła wiadomość ' .. mess)
  isTriggered = true
end)
