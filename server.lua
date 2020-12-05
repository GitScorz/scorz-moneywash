--------------------------------
---------- SCORZ#0001 ----------
--------------------------------

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("scorz_moneywash:wash")
AddEventHandler('scorz_moneywash:wash', function(moneyToWash)

	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()
    local black_money_amount = xPlayer.getAccount('black_money').money
    
    if black_money_amount == 0 then
        TriggerClientEvent('esx:showNotification', source, Language['dont_have_black'])
        return
    end

    if moneyToWash >= Config.MinimumAmount then
        if black_money_amount >= moneyToWash then
            xPlayer.addMoney(moneyToWash) -- Adds the normal money
            xPlayer.removeAccountMoney('black_money', moneyToWash) -- Removes Dirty Money

            TriggerClientEvent('esx:showNotification', source, Language['you_washed']:format(moneyToWash))
        else
            TriggerClientEvent('esx:showNotification', source, Language['insuficient_money'])
        end
    else
        TriggerClientEvent('esx:showNotification', source, Language['minimum_amount']:format(Config.MinimumAmount))
    end
end)