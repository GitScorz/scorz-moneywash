Config = {}

Config.DrawDistance = 7.0
Config.MinimumAmount = 300
Config.EnableAllJobsToWash = false

Config.KeyToWash = 38 -- E

Config.MoneyWash = {
    Pos = { 1136.8, -991.8, 46.12 },
    WhitelistedJobs = { -- Only enabled if Config.EnableAllJobsToWash = true
        'mafia', 
        'police'
        --[[ 'vanilla' ]] 
    }, 
}

Language = {
    ['money_wash'] = "Wash Money",
    ['amount_to_wash'] = "Amount to wash", -- Menu Title
    ['press_to_wash'] = "~r~[E]~w~ Wash Money",
    ['minimum_amount'] = "You need to put at least ~g~$%s~w~ to wash!",
    ['invalid_amount'] = "~r~Invalid Amount",
    ['dont_have_black'] = "You dont have black money!",
    ['you_washed'] = "You washed ~g~$%s~w~ black money!",
    ['insuficient_money'] = "You dont have suficient black money!",
    ['no_cops'] = "There are insuficient ~b~cops~w~ online! Minimum: ~r~%s",
}
