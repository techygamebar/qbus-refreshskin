-- CHANGE CORE NAME ACCORDINGLY
QBCore = nil

Citizen.CreateThread(function() 
  while true do
    Citizen.Wait(1)
    if QBCore == nil then
      TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) 
      Citizen.Wait(200)
    end
  end
end)

-- FUNCTION
function refreshskin()
  local model = nil
  local gender = QBCore.Functions.GetPlayerData().charinfo.gender
  if gender == 1 then 
    model = GetHashKey("mp_f_freemode_01") 
  else 
    model = GetHashKey("mp_m_freemode_01") 
  end 
  
  RequestModel(model)

  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)

  TriggerServerEvent("qb-clothes:loadPlayerSkin") 
end

---COMMAND
RegisterCommand(Config.Commandname, function()
  refreshskin()
end)
