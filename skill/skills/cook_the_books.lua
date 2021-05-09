local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Cook the books"
skill.description = "Shuffle the card back into your deck"
skill.requirements = {""}
skill.color = skill_colors.neutral

function skill:can_play_card(card_name)
	return true
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, false
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	local card_ids = {}
	for i = 1, #cards_data do
		card_ids[#card_ids + 1] = cards_data[i].id
	end
	skill_character_helpers.shuffle_into_deck(card_player_url, card_ids)
end

return skill