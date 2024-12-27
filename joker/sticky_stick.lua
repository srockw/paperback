SMODS.Joker {
    key = 'sticky_stick',
    loc_txt = {
        name = "Sticky Stick",
        text = {
            "Gives {X:mult,C:white}X#1#{} Mult for every",
            "other {C:attention}\"Stick\"{} Joker you have...",
            "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} mult)"
        }
    },
    config = {
        extra = {
            xMult = 1
        }
    },
    rarity = 2,
    pos = { x = 5, y = 3 },
    atlas = 'jokers_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = nil,
    yes_pool_flag = "sticks_can_spawn",

    loc_vars = function(self, info_queue, card)
        local xMult = PB_UTIL.calculate_stick_xMult(card)

        return {
            vars = {
                card.ability.extra.xMult,
                xMult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local xMult = PB_UTIL.calculate_stick_xMult(card)

            if xMult ~= 1 then
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { xMult } },
                    Xmult_mod = xMult,
                    card = card
                }
            end
        end
    end
}