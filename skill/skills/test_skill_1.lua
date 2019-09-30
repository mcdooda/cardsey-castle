local cards = require("card.cards")

local skill = {}

skill.description = "Balance health points"
skill.requirements = "Jokers only"

function skill:can_play_card(card_name)
	return card_name and cards.is_joker(card_name)
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url)
	local card_player_max_health_points = go.get(card_player_url, "health_points")
	local card_player_health_points = math.ceil(card_player_max_health_points / 2)
	msg.post(card_player_url, "set_health_points", { health_points = card_player_health_points})
	
	local opponent_max_health_points = go.get(opponent_url, "health_points")
	local opponent_health_points = math.ceil(opponent_max_health_points / 2)
	msg.post(opponent_url, "set_health_points", { health_points = opponent_health_points})
end

return skill