local riolu = {
  name = "riolu",
  pos = {x = 4, y = 4},
  config = {extra = {Xmult_minus = 0.75, rounds = 2,}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    info_queue[#info_queue+1] = {set = 'Other', key = 'baby'}
    info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}}
    return {vars = {center.ability.extra.Xmult_minus, center.ability.extra.rounds }}
  end,
  rarity = 2,
  cost = 4,
  stage = "Baby",
  ptype = "Fighting",
  atlas = "Pokedex4",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        faint_baby_poke(self, card, context)
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_minus}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_minus
        }
      end
    end
    local evo = level_evo(self, card, context, "j_Bizarre_lucario")
    if evo and type(evo) == "table" then
    local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_aura')
      local edition = {negative = true}
      _card:set_edition(edition, true)
      _card:add_to_deck()
      G.consumeables:emplace(_card)
    end
    return evo
  end,
}
-- lucario
local lucario = {
  name = "lucario",
  pos = {x = 5, y = 4},
  config = {extra = {chips = 0, chip_mod = 15, Xmult_mod = 1.2}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari",
  cost = 7,
  stage = "One",
  ptype = "Fighting",
  atlas = "Pokedex4",
  perishable_compat = true,
  blueprint_compat = true,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    end
  if context.individual and not context.end_of_round and context.cardarea == G.play then
    if context.other_card.edition then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
      return {
        card = card,
        colour = G.C.CHIPS,
        message = localize('k_upgrade_ex'),
      }
    end
  end
    if context.other_joker and context.other_joker.config and context.other_joker.edition then
      G.E_MANAGER:add_event(Event({
        func = function()
          context.other_joker:juice_up(0.2, 0.2)
          return true
        end
      })) 
      return {
        message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_mod}}, 
        colour = G.C.XMULT,
        Xmult_mod = card.ability.extra.Xmult_mod
      }
    end
    end,
  }

  if Bizarre_config.Riolu then
  list = {riolu, lucario}
else list = {}
end

return {name = "Riolu", 
list = list
}
