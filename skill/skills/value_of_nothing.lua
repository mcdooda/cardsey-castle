local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Value of nothing"
skill.description = "Discard lower value cards from your deck"
skill.requirements = {"Number"}
skill.color = skill_colors.heal

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	local card_name = cards_data[1].name
	local max_value = 0
	if cards.is_joker(card_name) then
		max_value = 15
	else
		max_value = cards.get_value(card_name)
	end
	skill_character_helpers.discard_stack_cards_of_lesser_value(card_player_url, max_value)
end

return skill