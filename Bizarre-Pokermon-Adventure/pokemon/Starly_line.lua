local starly = {
    name = "starly",
    config = {extra = {mult = 0, mult_mod = 2, rounds = 3}},
    pos = { x = 9, y = 0 },
    rarity= 1,
    cost = 5,
    stage = "Basic", 
    atlas = "Pokedex4",
    ptype = "Colorless",
    blueprint_compat=false,
    eternal_compat=false,
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        -- Ensure extra table exists to avoid runtime errors
        center.ability.extra = center.ability.extra or {mult = 0, mult_mod = 4}
        return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.rounds}}
    end,
    calculate = function(self, card, context)
      if context.remove_playing_cards and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
      end
       if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult
        }
      end
      return level_evo(self, card, context, "j_Bizarre_staravia")
    end,
}
-- Staraptor 398
local staravia = {
    name = "staravia",
    config = {extra = {mult = 0, mult_mod = 4, rounds = 5}},
    pos = { x = 10, y = 0 },
    rarity= 2,
    cost = 5,
    stage = "One", 
    atlas = "Pokedex4",
    ptype = "Colorless",
    blueprint_compat=false,
    eternal_compat=false,
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        -- Ensure extra table exists to avoid runtime errors
        center.ability.extra = center.ability.extra or {mult = 0, mult_mod = 4}
        return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.rounds}}
    end,
    calculate = function(self, card, context)
      if context.setting_blind then
        if G.GAME.blind and G.GAME.blind.chips then
          G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.95)
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
          local chips_UI = G.hand_text_area.blind_chips
          G.FUNCS.blind_chip_UI_scale(chips_UI)
          G.HUD_blind:recalculate()
        end
      end
      if context.setting_blind and not self.getting_sliced then
        if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The wall')) then
          card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
          G.GAME.blind:disable()
        end
      end
      if context.remove_playing_cards and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
      end
       if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult
        }
      end
      return level_evo(self, card, context, "j_Bizarre_staraptor")
    end,
}
local staraptor = {
    name = "staraptor",
    config = {extra = {mult = 0, mult_mod = 8}},
    pos = { x = 11, y = 0 },
    rarity= "poke_safari",
    cost = 5,
    stage = "Two", 
    atlas = "Pokedex4",
    ptype = "Colorless",
    blueprint_compat=false,
    eternal_compat=false,
    loc_vars = function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        -- Ensure extra table exists to avoid runtime errors
        center.ability.extra = center.ability.extra or {mult = 0, mult_mod = 4}
        return {vars = {center.ability.extra.mult, center.ability.extra.mult_mod}}
    end,
    calculate = function(self, card, context)
      if context.setting_blind then
        if G.GAME.blind and G.GAME.blind.chips then
          G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 0.90)
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
          local chips_UI = G.hand_text_area.blind_chips
          G.FUNCS.blind_chip_UI_scale(chips_UI)
          G.HUD_blind:recalculate()
        end
      end
      if context.setting_blind and not self.getting_sliced then
        if G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.name == 'The wall')) then
          card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
          G.GAME.blind:disable()
        end
      end
      if context.remove_playing_cards and not context.blueprint then
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("k_upgrade_ex")})
      end
       if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult
        }
      end
    end
}

if Bizarre_config.Starly then
  list = {starly, staravia, staraptor}
else list = {}
end

return {name = "Starly", 
list = list
}