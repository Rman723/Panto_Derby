local player = GetPlayerPed(-1)
local isstarted = false
local pwhostart = 0
local startstart = false
local cspawns = {
    crds = {
        {x = -68.96332, y = -814.3019, z = 325.4567, h = 126.06},
        {x = -67.7275390625, y = -816.7880859375, z = 325.45669555664, h = 105.39478302002},
        {x = -67.417549133301, y = -819.30120849609, z = 325.45645141602, h = 88.141754150391},
        {x = -67.770881652832, y = -821.73345947266, z = 325.45651245117, h = 72.341369628906},
        {x = -69.039604187012, y = -823.84942626953, z = 325.45657348633, h = 50.042984008789},
        {x = -70.569030761719, y = -825.3115234375, z = 325.45678710938, h = 34.022888183594},
        {x = -72.825347900391, y = -826.50677490234, z = 325.45660400391, h = 19.326858520508},
        {x = -75.385925292969, y = -826.80187988281, z = 325.45657348633, h = 357.4548034668},
        {x = -77.848831176758, y = -826.40325927734, z = 325.4719543457, h = 344.73004150391},
        {x = -80.001556396484, y = -825.12994384766, z = 325.4560546875, h = 318.17401123047},
        {x = -81.463584899902, y = -823.314453125, z = 325.47201538086, h = 303.72348022461},
        {x = -82.522193908691, y = -821.150390625, z = 325.45571899414, h = 287.95135498047},
        {x = -82.82137298584, y = -818.55737304688, z = 325.45639038086, h = 269.13751220703},
        {x = -82.411155700684, y = -816.02166748047, z = 325.45611572266, h = 250.75064086914},
        {x = -81.021469116211, y = -813.64892578125, z = 325.46197509766, h = 229.01992797852},
        {x = -79.205360412598, y = -812.22259521484, z = 325.45672607422, h = 210.38572692871},
        {x = -76.902954101562, y = -811.36389160156, z = 325.45666503906, h = 194.90188598633},
        {x = -74.421287536621, y = -811.30303955078, z = 325.45617675781, h = 177.89277648926},
        {x = -71.855743408203, y = -812.01330566406, z = 325.47079467773, h = 152.59297180176}
    }
}

--This is where it all starts
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local playerCoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playerCoords, -75.2449, -818.9309, 326.1751, true)
        if isstarted == false then
            if distance < 3 and IsControlJustPressed(1, 38) then
                TriggerServerEvent('panto:checkstart')
            end
        end
    end
end)

--This creates all the cars
RegisterNetEvent('panto:started')
AddEventHandler('panto:started', function()
    --Spawn cars
    local cars = 'panto'
    RequestModel(cars)
    while not HasModelLoaded(cars) do
        Wait(500)
    end
    for k,v in pairs(cspawns.crds) do
        local vehicle = CreateVehicle(cars, v.x, v.y, v.z, v.h, true, false)
        SetModelAsNoLongerNeeded(cars)
    end
    --Yea
    isstarted = true
    pwhostart = player
    startstart = true
    while true do 
        Citizen.Wait(10)
        local playerCoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playerCoords, -67.815391540527,-811.01409912109,326.1741027832, true)
        if startstart == true then
            if distance < 3 and IsControlJustPressed(1, 38) then
                startstart = false
                TriggerServerEvent('panto:starting')
            end
        end
    end

end)
--Turns back on that blio
RegisterNetEvent('panto:timedone')
AddEventHandler('panto:timedone', function()
    isstarted = false
end)
--Uselsess because i dum dum
RegisterNetEvent('panto:cant')
AddEventHandler('panto:cant', function(timeleft)
    chat("There is "..timeleft..' seconds left' , {255,0,0})
end)

-- :-)
local bro = 0
local timesmile = nil
RegisterNetEvent('panto:gogo')
AddEventHandler('panto:gogo', function()
    SetAudioFlag("LoadMPData", true)
    local playerCoords = GetEntityCoords(player)
    local distance = GetDistanceBetweenCoords(playerCoords, -75.2449, -818.9309, 326.1751, true)
    bro = 0
    if distance < 11 then
        while true do 
            Citizen.Wait(10)
            if bro == 0 then
                bro = 1
                Citizen.Wait(5000)
                --3
                PlaySoundFrontend(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", false)
                chat("Derby Starts In 3", {255,0,0})
                timesmile = 3
                Citizen.Wait(1000)
                --2
                timesmile = 2
                PlaySoundFrontend(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", false)
                chat("Derby Starts In 2", {255,0,0})
                Citizen.Wait(1000)
                --1
                timesmile = 1
                PlaySoundFrontend(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", false)
                chat("Derby Starts In 1", {255,0,0})
                
                Citizen.Wait(1000)
                --GO
                timesmile = go 
                chat("GO GO GO", {255,0,0})
                PlaySoundFrontend(-1, "Countdown_GO", "DLC_SR_TR_General_Sounds", true)
                PlaySoundFrontend(-1, "Countdown_GO", "DLC_SR_TR_General_Sounds", true)
                PlaySoundFrontend(-1, "Countdown_GO", "DLC_SR_TR_General_Sounds", true)
                PlaySoundFrontend(-1, "Countdown_GO", "DLC_SR_TR_General_Sounds", true)
                TriggerServerEvent('panto:startcountdown')
            end
        end
    end
end)


--Marker
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
        if isstarted == false then 
            DrawMarker(27 ,-75.2449, -818.9309, 325.1751, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 100, 0, 110, 0, 1, 0, 1)
        end
        if startstart == true then 
            DrawMarker(27 ,-67.815391540527,-811.01409912109,325.1741027832, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 225, 100, 100, 110, 0, 1, 0, 1)
        end
    end
end)

function text(content) 
    SetTextFont(1)
    SetTextColour(255, 255, 0, 0)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(0.9,0.7)
end

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(-75.71395111084,-819.5244140625,326.17517089844)
    SetBlipSprite (blip, 225)
    SetBlipColour(blip, 15)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 1.0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Panto Derby")
    EndTextCommandSetBlipName(blip)
    
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local playerCoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playerCoords, -79.399154663086,-796.57250976562,44.227294921875, true)
        local distance2 = GetDistanceBetweenCoords(playerCoords, -67.751808166504,-821.7001953125,321.28732299805, true)
        if distance < 3 and IsControlJustPressed(1, 38) then
            SetEntityCoords(player, -67.751808166504,-821.7001953125,321.28732299805, 0, 0, 0, false)
        end
        if distance2 < 3 and IsControlJustPressed(1, 38) then
            SetEntityCoords(player, -79.399154663086,-796.57250976562,44.227294921875, 0, 0, 0, false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        Draw3DText(-79.399154663086,-796.57250976562,45.227294921875, 0.5, "Press [E] To Go Up To The Helipad")
        Draw3DText(-67.751808166504,-821.7001953125,322.28732299805, 0.5, "Press [E] To Go Down To The Ground")
    end
end)

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end