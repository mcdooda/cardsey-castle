local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Three strikes"
skill.description = "Deal 123 damage"
skill.requirements = {"1", "2", "3"}
skill.color = skill_colors.damage

function skill:can_play_card(card_name, card_slot_index)
	return card_name and (cards.is_joker(card_name) or cards.get_value(card_name) == card_slot_index)
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return opponent_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.deal_damage(opponent_url, 123)
end

return skill