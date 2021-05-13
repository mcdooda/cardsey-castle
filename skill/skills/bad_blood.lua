local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Bad blood"
skill.description = "Discard 3 faces"
skill.requirements = {"Jack", "Queen", "King"}
skill.color = skill_colors.damage

function skill:can_play_card(card_name, card_slot_index)
	if card_slot_index == 1 then
		return card_name and (cards.is_joker(card_name) or cards.is_jack(card_name))
	elseif card_slot_index == 2 then
		return card_name and (cards.is_joker(card_name) or cards.is_queen(card_name))
	else
		assert(card_slot_index == 3)
		return card_name and (cards.is_joker(card_name) or cards.is_king(card_name))
	end
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	
end

return skill