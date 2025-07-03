return {
    descriptions = {
        Joker = {
            j_Bizarre_bagon = {
                name = 'Bagon',
                text = {
                    "Gains {C:chips}+#2#{} Chips if played hand",
                    "is a {C:attention}Five of a Kind{}",
                    "Gains {C:chips}+#2#{} Chips if played hand", 
                    "and contains an {C:attention}2, {C:attention}3, {C:attention}4 or {C:attention}5",
                    "{C:inactive}(Evolves at {C:chips}+#1#{C:inactive} / +96 Chips)",
                }
            },
            j_Bizarre_shelgon = {
                name = 'Shelgon',
                text = {
                    "{C:chips}+#3#{} hands",    
                    "Gains {C:chips}+#2#{} Chips if played hand",
                    "is a {C:attention}Five of a Kind{}",
                    "Gains {C:chips}+#2#{} Chips if played hand", 
                    "and contains an {C:attention}6, {C:attention}7, {C:attention}8, {C:attention}9 or {C:attention}10",
                    "{C:inactive}(Evolves at {C:chips}+#1#{C:inactive} / +272 Chips)",
                }
            },
            j_Bizarre_salamence = {
                name = 'Salamence',
                text = {
                    "{C:chips}+#2#{} hands, {C:chips}+#1#{} Chips" ,
                    "{br:3}ERROR - CONTACT STEAK",
                    "If played hand is a {C:attention}Five of a Kind{} gains {C:mult}X#4#{} Mult ",
                    "{C:inactive}(Currently {C:mult}X#3#{} {C:inactive}Mult)",
                }
            },
            j_Bizarre_starly = {
                name = "Starly",     
                text = {
                    "Gains {C:mult}+#2#{} Mult when a card is destroyed",
                    "{C:inactive}(Currently {C:mult}+#1#{} Mult {})",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                },
            },
            j_Bizarre_staravia = {
                name = "Staravia",     
                text = {
                    "When blind is selected",
                    "{C:attention}Decrease{} the blind score requirement by 5%",
                    "Gains {C:mult}+#2#{} Mult when a card is destroyed",
                    "{C:inactive}(Currently {C:mult}+#1#{} Mult {})",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)",
                },
            },
            j_Bizarre_staraptor = {
                name = "Staraptor",     
                text = {
                    "When blind is selected",
                    "{C:attention}Decrease{} the blind score requirement by 10%",
                    "Gains {C:mult}+#2#{} Mult when a card is destroyed",
                    "{C:inactive}(Currently {C:mult}+#1#{} Mult {})",
                },
            },
            j_Bizarre_riolu = {
                name = 'Riolu',
                text = {
                    "{C:attention}Baby{}, {X:red,C:white} X#1# {} Mult",
                    "Create a {C:dark_edition}Negative{} Aura{}", 
                    " when this joker evolves",
                }
            },
            j_Bizarre_lucario = {
                name = "Lucario",
                text = {
                    "{C:attention}Editioned{} Jokers give {X:mult,C:white} X#3# {} Mult when scoring",
                    "{br:2}text needs to be here to work",
                    "Gains {C:chips}+#2#{} Chips when an {C:attention}Editioned{} card",
                    "is scored",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                }
            },
            j_Bizarre_axew = {
                name = 'Axew',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{br:3}ERROR - CONTACT STEAK",
                    "Gain {X:mult,C:white}X#3#{} Mult if played hand contains a {C:attention}Two Pair{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#4#{C:inactive,s:0.8} rounds)",
                }
            },
            j_Bizarre_fraxure = {
                name = 'Fraxure',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{br:3}ERROR - CONTACT STEAK",
                    "Gain {X:mult,C:white}X#3#{} Mult if played hand contains a {C:attention}Two Pair{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#4#{C:inactive,s:0.8} rounds)",
                }
            },
            j_Bizarre_haxorus = {
                name = 'Haxorus',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{br:3}ERROR - CONTACT STEAK",
                    "Gain {X:mult,C:white}X#3#{} Mult if played hand contains a {C:attention}Two Pair{}",
                    "Resets if played hand does not contain a {C:attention}Two Pair{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
                }
            },
            j_Bizarre_gfarfetchd = {
                name = 'Gfarfetchd',      
                text = {
                    "{C:attention}Holding Leek{}",
                    "{C:green}#5# in #6#{} chance to gain {C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
                    "when a {C:attention}Consumable{} is used",
                    "Increased Chips and Mult are guaranteed when using {C:attention}Leeks{}",
                    "{C:inactive}(Currently {C:chips}+#2#{}, {C:mult}+#1#{} )",
                    "{C:inactive,s:0.8}(Evolves after using {C:attention,s:0.8}#7#{C:inactive,s:0.8} consumables)",
                }
            },
            j_Bizarre_sirfetchd = {
                name = 'Sirfetch\'d',      
                text = {
                    "{C:attention}+#5#{} consumable slots",
                    "{C:green}#6# in #7#{} chance to gain {C:chips}+#4#{} Chips and {C:mult}+#3#{} Mult",
                    "when a {C:attention}Consumable{} is used",
                    "Increased Chips and Mult guaranteed when using {C:attention}Leeks{}",
                    "{C:inactive}(Currently {C:chips}+#2#{}, {C:mult}+#1#{} )",
                }
            }
        }
    }
}