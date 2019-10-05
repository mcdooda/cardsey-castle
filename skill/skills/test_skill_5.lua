local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.description = "Divide health by 2"
skill.requirements = "Aces only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_ace(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url, skill_id)
	local opponent_health_points = skill_character_helpers.get_health_points(opponent_url)
	local opponent_new_health_points = math.floor(opponent_health_points / 2)
	skill_character_helpers.set_health_points(opponent_url, opponent_new_health_points)
end

return skill