local bagon = {
  name = "bagon", 
  pos = {x = 2, y = 12},
  config = {extra = {chips = 0, chip_mod = 8}, evo_rqmt = 96},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
  end,
  rarity = 2, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Dragon",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
        if context.before and not context.blueprint then
          local has_number = false
          for i = 1, #context.scoring_hand do
              local id = context.scoring_hand[i]:get_id()
              if id >= 2 and id <= 5 then has_number = true; break end
          end
        if has_number or context.scoring_name == "Five of a Kind" then
          if has_number and context.scoring_name == "Five of a Kind" then
            card.ability.extra.chips = card.ability.extra.chips + 2 * card.ability.extra.chip_mod
          else
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
          end
        end
      end
       if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
        }
      end
    end
    return scaling_evo(self, card, context, "j_Bizarre_shelgon", card.ability.extra.chips, self.config.evo_rqmt)
  end,
}
-- Shelgon 372
local shelgon={
  name = "shelgon", 
  pos = {x = 3, y = 12},
  config = {extra = {chips = 0, chip_mod = 16, hands = 1 }, evo_rqmt = 272 },
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.hands}}
  end,
  rarity = "poke_safari", 
  cost = 8, 
  stage = "One", 
  ptype = "Dragon",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        local has_ten = false
        for i = 1, #context.scoring_hand do
          local id = context.scoring_hand[i]:get_id()
          if id >= 6 and id <= 10 then has_ten = true; break end
        end
        if (has_ten or context.scoring_name == "Five of a Kind") then
          if has_ten and context.scoring_name == "Five of a Kind" then
            card.ability.extra.chips = card.ability.extra.chips + 2 * card.ability.extra.chip_mod
          else
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
          end
        end
      end
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
        }  
      end
    end
    return scaling_evo(self, card, context, "j_Bizarre_salamence", card.ability.extra.chips, self.config.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    if not from_debuff then
      ease_hands_played(card.ability.extra.hands)
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    local to_decrease = math.min(G.GAME.current_round.hands_left - 1, card.ability.extra.hands)
    if to_decrease > 0 then
      ease_hands_played(-to_decrease)
    end
  end
}
-- Salamence 373
local salamence={
  name = "salamence", 
  pos = {x = 4, y = 12},
  config = {extra = {chips = 152, hands = 2, Ymult = 1, Xmult_mod = 0.25}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.hands, center.ability.extra.Ymult, center.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari", 
  cost = 10, 
  stage = "Two", 
  ptype = "Dragon",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    -- Gain the mod only when a 'Five of a Kind' is actually scored
    if context.cardarea == G.jokers and context.scoring_name == "Five of a Kind" and context.before and not context.blueprint and not (context.other_card and context.other_card.debuff) then
      card.ability.extra.Ymult = card.ability.extra.Ymult + card.ability.extra.Xmult_mod
      return {
        message = localize('k_upgrade_ex'),
        colour = G.C.RED
      }
    end
    if context.cardarea == G.jokers and context.scoring_hand and context.joker_main then
      -- Show Xmult if Ymult > 0, otherwise show chips
      if card.ability.extra.Ymult and card.ability.extra.Ymult > 0 then
        return {
          message = localize("poke_dragon_rush_ex"),
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Ymult,
        }
      else
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  end,
}

if Bizarre_config.Bagon then
  list = {bagon, shelgon, salamence}
else list = {}
end

return {name = "Bagon", 
list = list
}