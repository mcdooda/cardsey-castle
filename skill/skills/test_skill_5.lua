local cards = require("card.cards")

local skill = {}

skill.description = "Divide health by 2"
skill.requirements = "Aces only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_ace(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url)
	local opponent_health_points = go.get(opponent_url, "health_points")
	local damage = math.floor(opponent_health_points / 2)
	msg.post(opponent_url, "deal_damage", { amount = damage })
end

return skill