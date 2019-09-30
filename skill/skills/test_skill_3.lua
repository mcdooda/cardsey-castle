local cards = require("card.cards")

local skill = {}

skill.description = "Red: Heal [X]\nBlack: Deal [X] damage"
skill.requirements = "Face down cards only"

function skill:can_play_card(card_name)
	return not card_name
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url)
	if cards.is_red(card_name) then
		local heal_amount = 0
		if cards.is_joker(card_name) then
			heal_amount = 999
		else
			heal_amount = cards.get_value(card_name)
		end
		msg.post(card_player_url, "heal", { amount = heal_amount })
	else
		local damage = 0
		if cards.is_joker(card_name) then
			damage = 999
		else
			damage = cards.get_value(card_name)
		end
		msg.post(opponent_url, "deal_damage", { amount = damage })
	end
end

return skill