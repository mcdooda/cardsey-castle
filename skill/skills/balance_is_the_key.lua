local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Balance is the key"
skill.description = "Balance health points"
skill.requirements = {"Joker"}
skill.color = skill_colors.neutral_gray

function skill:can_play_card(card_name)
	return card_name and cards.is_joker(card_name)
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	local card_player_health_points = skill_character_helpers.get_health_points(card_player_url)
	local opponent_health_points = skill_character_helpers.get_health_points(opponent_url)

	local balance = math.floor((card_player_health_points + opponent_health_points) / 2)
	decision.balance = balance
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.set_health_points(card_player_url, decision.balance)
	skill_character_helpers.set_health_points(opponent_url, decision.balance)
end

return skill