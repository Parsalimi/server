-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = 'police',
    Command = 'policedog', -- set to false if you dont want to have a command
    Model = 351016938,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {'weed', 'cocaine', 'meth'}, -- add all drugs here for the dog to detect
}

Strings = {
    ['not_police'] = 'No eres Policia',
    ['menu_title'] = 'Rex, Perro Policia',
    ['take_out_remove'] = 'Sacar / Borrar a Rex',
    ['deleted_dog'] = 'Rex se ha ido',
    ['spawned_dog'] = 'Llamar a Rex',
    ['sit_stand'] = 'Hacer que Rex se siente',
    ['no_dog'] = "No tienes ningun perro",
    ['dog_dead'] = 'Rex ha muerto...',
    ['search_drugs'] = 'Buscar drogas en un jugador cercano',
    ['no_drugs'] = 'No encontró drogas', 
    ['drugs_found'] = 'Encontró drogas',
    ['dog_too_far'] = 'Rex está muy lejos!',
    ['attack_closest'] = 'Atacar a un jugador cercano'
}