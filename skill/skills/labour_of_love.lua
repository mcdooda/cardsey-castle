local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Labour of love"
skill.description = "Heal"
skill.requirements = {"Jack"}
skill.color = skill_colors.heal

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_jack(card_name))
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.heal(card_player_url, 20)
end

return skill