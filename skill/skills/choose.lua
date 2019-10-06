local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.name = "Choose your weapon"
skill.description = "Deal [X] damage"
skill.requirements = "Numbers only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return opponent_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	local damage = 0
	if cards.is_joker(card_name) then
		damage = 15
	else
		damage = cards.get_value(card_name)
	end
	skill_character_helpers.deal_damage(opponent_url, damage)
end

return skill