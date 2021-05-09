local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Choose your weapon"
skill.description = "Deal [X] damage"
skill.requirements = {"Numbers only"}
skill.color = skill_colors.damage

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return opponent_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	local card_name = cards_data[1].name
	local damage = 0
	if cards.is_joker(card_name) then
		damage = 15
	else
		damage = cards.get_value(card_name)
	end
	skill_character_helpers.deal_damage(opponent_url, damage)
end

return skill