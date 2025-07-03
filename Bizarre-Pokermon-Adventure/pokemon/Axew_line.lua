    local axew ={
  name = "axew", 
  pos = {x = 4, y = 8},
  config = {extra = {chips = 87, Xmult = 1, Xmult_mod = 0.02, rounds = 3 }},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.Xmult, center.ability.extra.Xmult_mod, center.ability.extra.rounds}}
  end,
  rarity = 2, 
  cost = 5, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips, card.ability.extra.Xmult}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
          Xmult_mod = card.ability.extra.Xmult,
          card = card
        }
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
      if context.before and next(context.poker_hands['Two Pair']) then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
        return {
          message = localize('poke_dual_chop_ex'),
          colour = G.C.MULT
        }
      end
    end
    return level_evo(self, card, context, "j_Bizarre_fraxure")
  end
}

-- Fraxure 611
local fraxure ={
  name = "fraxure", 
  pos = {x = 5, y = 8},
  config = {extra = {chips = 117, Xmult = 1, Xmult_mod = 0.12, rounds = 4 }},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.Xmult, center.ability.extra.Xmult_mod, center.ability.extra.rounds}}
  end,
  rarity = 3, 
  cost = 7, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
 calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips, card.ability.extra.Xmult}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
          Xmult_mod = card.ability.extra.Xmult,
          card = card
        }
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
      if context.before and next(context.poker_hands['Two Pair']) then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
        return {
          message = localize('poke_dual_chop_ex'),
          colour = G.C.MULT
        }
      end
    end
    return level_evo(self, card, context, "j_Bizarre_haxorus")
  end
}

-- Haxorus 612
local haxorus ={
  name = "haxorus", 
  pos = {x = 6, y = 8},
  config = {extra = {chips = 147, Xmult = 1, Xmult_mod = 0.22 }},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.Xmult, center.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari", 
  cost = 10, 
  stage = "Two", 
  ptype = "Dragon",
  atlas = "Pokedex5",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips, card.ability.extra.Xmult}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
          Xmult_mod = card.ability.extra.Xmult,
          card = card
        }
      end
    end
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
      if context.before and next(context.poker_hands['Two Pair']) then
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
        return {
          message = localize('poke_outrage_ex'),
          colour = G.C.MULT
        }
      elseif context.before and card.ability.extra.Xmult > 0 then
        -- Reset only when a hand is scored that is NOT a Two Pair
        card.ability.extra.Xmult = 1
        return {
          message = localize('k_reset'),
          colour = G.C.RED
        }
      end
    end
  end
}

if Bizarre_config.Axew then
  list = {axew, fraxure, haxorus}
else list = {}
end

return {name = "Axew", 
list = list
}
