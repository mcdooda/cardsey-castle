local cards = require("card.cards")

local skill = {}

skill.description = "Deal [X] damage"
skill.requirements = "Numbers only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url)
	local damage = 0
	if cards.is_joker(card_name) then
		damage = 15
	else
		damage = cards.get_value(card_name)
	end
	msg.post(opponent_url, "deal_damage", { amount = damage })
end

return skill