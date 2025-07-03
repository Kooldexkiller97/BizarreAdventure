local gfarfetchd = {
  name = "gfarfetchd",
  pos = {x = 5, y = 2},
  config = {
    extra = {mult = 0, mult_mod = 1, chips = 0, chips_mod = 1, odds = 4, consumables_used = 0},
    evo_rqmt = 22
  },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_leek
    info_queue[#info_queue+1] = {set = 'Other', key = 'holding', vars = {"Leek"}}
    local consumables_left = math.max(0, self.config.evo_rqmt - (center.ability.extra.consumables_used or 0))
    return {vars = {center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.mult_mod, center.ability.extra.chips_mod, tostring(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, consumables_left}}
  end,
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Fighting",
  joblacklist = true,
  atlas = "Regionals",
  blueprint_compat = true,
  add_to_deck = function(self, card, from_debuff)
    if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_poke_leek')
      _card:add_to_deck()
      G.consumeables:emplace(_card)
      card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
      return true
    end
  end,
  calculate = function(self, card, context)
    if context.using_consumeable then
      card.ability.extra.consumables_used = (card.ability.extra.consumables_used or 0) + 1
      if (pseudorandom('farfet') < G.GAME.probabilities.normal/card.ability.extra.odds) or (context.consumeable and context.consumeable.ability and context.consumeable.ability.name == "leek") then
        card:juice_up()
        card.ability.extra.mult = (card.ability.extra.mult or 0) + (card.ability.extra.mult_mod or 1)
        card.ability.extra.chips = (card.ability.extra.chips or 0) + (card.ability.extra.chips_mod or 1)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
      end
    end
     if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips, card.ability.extra.mult}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
          mult_mod = card.ability.extra.mult
        }
      end
    return scaling_evo(self, card, context, "j_Bizarre_sirfetchd", card.ability.extra.consumables_used, self.config.evo_rqmt)
  end,
}
local sirfetchd = {
  name = "sirfetchd",
  pos = {x = 2, y = 4},
  config = {extra = {mult = 0, mult_mod = 2, chips = 0, chips_mod = 2, odds = 2, card_limit = 1}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_poke_leek
    info_queue[#info_queue+1] = {set = 'Other', key = 'holding', vars = {"Leek"}}
    return {vars = {center.ability.extra.mult, center.ability.extra.chips, center.ability.extra.mult_mod, center.ability.extra.chips_mod, center.ability.extra.card_limit, ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
  end,
  rarity = "poke_safari",
  cost = 8,
  stage = "Stage 1",
  ptype = "Fighting",
  joblacklist = true,
  atlas = "Pokedex8",
  blueprint_compat = true,
  add_to_deck = function(self, card, from_debuff)
    -- Increase card limit when added to deck
    G.E_MANAGER:add_event(Event({func = function()
      G.consumeables.config.card_limit = G.consumeables.config.card_limit + (card.ability.extra.card_limit or 0)
      return true 
    end
    }))
  end,
  remove_from_deck = function(self, card, from_debuff)
    -- Decrease card limit when removed from deck
    G.E_MANAGER:add_event(Event({func = function()
      G.consumeables.config.card_limit = G.consumeables.config.card_limit - (card.ability.extra.card_limit or 0)
      return true end }))
  end,
   calculate = function(self, card, context)
    if context.using_consumeable then
      if (pseudorandom('farfet') < G.GAME.probabilities.normal/card.ability.extra.odds) or (context.consumeable and context.consumeable.ability and context.consumeable.ability.name == "leek") then
        card:juice_up()
        card.ability.extra.mult = (card.ability.extra.mult or 0) + (card.ability.extra.mult_mod or 1)
        card.ability.extra.chips = (card.ability.extra.chips or 0) + (card.ability.extra.chips_mod or 1)
        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
      end
    end
    if context.joker_main then
      return {
        message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips, card.ability.extra.mult}}, 
        colour = G.C.CHIPS,
        chip_mod = card.ability.extra.chips,
        mult_mod = card.ability.extra.mult
      }
    end
  end
}

local list = {}
if Bizarre_config and Bizarre_config.Gfarfetchd then
  list = {gfarfetchd, sirfetchd}
end

return {name = "Gfarfetchd", 
list = list
}