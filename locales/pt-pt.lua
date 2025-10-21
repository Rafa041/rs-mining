local Translations = {
    error = {
        you_dont_have_pickaxe = "Não tem uma picareta!",
        something_went_wrong = 'Algo correu mal!',
        mining_cancelled = 'Mineração cancelada!',
        no_pickaxe_equipped = 'Precisa de equipar uma picareta!',
        pickaxe_broken = 'A sua picareta não tem durabilidade suficiente para minerar!',
        pickaxe_completely_broken = 'A sua picareta quebrou completamente!',
    },
    success = {
        your_pickaxe_broke = 'A sua picareta partiu-se!',
        mining_completed = 'Mineração concluída!',
        mining_successful = 'Mineração bem-sucedida!',
        excellent_mining = 'Excelente mineração!',
        rare_discovery = 'Descoberta rara!',
    },
    primary = {
        you_are_busy_the_moment = 'Está ocupado neste momento!',
        small_haul_time = 'Pequena colheita desta vez!',
        medium_haul_this_time = 'Colheita média desta vez!',
        large_haul_this_time = 'Grande colheita desta vez!',
        exceptional_haul = 'Colheita excecional!',
    },
    menu = {
        start = 'Iniciar Mineração',
        mining = 'Mineração',
        mining_spot = 'Ponto de Mineração',
        start_mining = 'Começar a Minerar',
        stop_mining = 'Parar Mineração',
    },
    info = {
        mining_started = 'A começar a minerar...',
        mining_in_progress = 'A minerar...',
        found_item = 'Encontrou: ',
        found_items = 'Encontrou: ',
        mining_time = 'Tempo de mineração: ',
        seconds = ' segundos',
        pickaxe_durability = 'Durabilidade da picareta: ',
    },
    durability = {
        title = 'Durabilidade da Picareta',
        warning_50 = 'Aviso: Sua picareta está meio desgastada',
        warning_25 = 'Aviso: Sua picareta está desgastada',
        warning_10 = 'Aviso: Sua picareta está muito desgastada',
        warning_critical = 'ATENÇÃO: Sua picareta está quase quebrada!',
        remaining = ' restante',
        percent = '%',
    },
    commands = {
        mining_help = 'Comandos de mineração disponíveis',
        start_mining_cmd = 'Iniciar mineração no local atual',
        stop_mining_cmd = 'Parar mineração atual',
    },
    progressbar = {
        mining = 'A minerar...',
        extracting_ore = 'A extrair minério...',
        searching = 'A procurar recursos...',
        breaking_rock = 'A partir rocha...',
    },
    blips = {
        mine = 'Mina',
        mining_spot = 'Ponto de Mineração',
        annesburg_mine = 'Mina de Annesburg',
        elysian_mine = 'Mina de Elysian Pool',
        valentine_mine = 'Mina de Valentine',
        strawberry_mine = 'Mina de Strawberry',
        desert_mine = 'Mina do Deserto',
        mysterious_mine = 'Mina Misteriosa',
    },
    rewards = {
        coal = 'Carvão',
        iron_ore = 'Minério de Ferro',
        copper_ore = 'Minério de Cobre',
        silver_ore = 'Minério de Prata',
        gold_nugget = 'Pepita de Ouro',
        quartz = 'Quartzo',
        gem = 'Gema',
        precious_stone = 'Pedra Preciosa',
    },
}

if GetConvar('rsg_locale', 'en') == 'pt-pt' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
