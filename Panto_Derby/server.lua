local started = false
local timeleft = 0

RegisterServerEvent('panto:checkstart')
AddEventHandler('panto:checkstart', function()
    if started == false and timeleft == 0 then
      started = true 
      TriggerClientEvent("panto:started", source)
      timeleft = 120 --2 minutes
    else
      TriggerClientEvent("panto:cant", source, timeleft)
    end
end)

RegisterServerEvent('panto:starting')
AddEventHandler('panto:starting', function()
  TriggerClientEvent("panto:gogo", -1)
end)

local countdownnow = false
RegisterServerEvent('panto:startcountdown')
AddEventHandler('panto:startcountdown', function()
  countdownnow = true
  if countdownnow == true then
    while true do
      Citizen.Wait(1000)
      if timeleft ~= 0 then
        timeleft = timeleft-1
      else
        started = false
        countdownnow = false
        TriggerClientEvent("panto:timedone", -1)
        break
      end
    end
  end
end)

