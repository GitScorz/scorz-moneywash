player = nil
coords = {}

Citizen.CreateThread(function()
    while true do
	  player = GetPlayerPed(-1)
	  coords = GetEntityCoords(player)
      Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local sleep = true

        if Config.EnableAllJobsToWash then
            local distance = Vdist(coords, Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3])

            if distance <= Config.DrawDistance and distance >= 2.0 then
                sleep = false
                DrawText3Ds(Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3], Language['money_wash'])
            elseif distance <= 2.0 then
                sleep = false
                DrawText3Ds(Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3], Language['press_to_wash'])
                if IsControlJustPressed(0, Config.KeyToWash) then
                    FreezeEntityPosition(player, true)
                    Wash()
                end
            end
        else
            local distance = Vdist(coords, Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3])
            for k,v in pairs(Config.MoneyWash.WhitelistedJobs) do
                if PlayerData.job and PlayerData.job.name == v then
                    if distance <= Config.DrawDistance and distance >= 2.0 then
                        sleep = false
                        DrawText3Ds(Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3], Language['money_wash'])
                    elseif distance <= 2.0 then
                        sleep = false
                        DrawText3Ds(Config.MoneyWash.Pos[1], Config.MoneyWash.Pos[2], Config.MoneyWash.Pos[3], Language['press_to_wash'])
                        if IsControlJustPressed(0, Config.KeyToWash) then
                            FreezeEntityPosition(player, true)
                            Wash()
                        end
                    end
                end
            end
        end

        if sleep then
            Citizen.Wait(500)
        end

    end
end)

function Wash()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'wash_dialog', {
        title = (Language['amount_to_wash'])
    }, function(data, menu)
        local amount = tonumber(data.value)

    if amount == nil then
      notify(Language['invalid_amount'])
    else
      menu.close()
      FreezeEntityPosition(player, false)
      TriggerServerEvent('scorz_moneywash:wash', amount)
    end

  end,
  function(data, menu)
    menu.close()
    FreezeEntityPosition(player, false)
  end)
end
