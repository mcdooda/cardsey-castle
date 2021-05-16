local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Lose"
skill.description = "Lose"
skill.requirements = {""}
skill.color = skill_colors.damage

function skill:can_play_card(card_name)
	return true
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.deal_damage(card_player_url, 999)
end

return skill