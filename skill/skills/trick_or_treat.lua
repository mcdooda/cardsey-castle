local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Trick or treat"
skill.description = "Red: Heal [X]\nBlack: Deal [X] damage"
skill.requirements = "Face down cards only"
skill.color = skill_colors.neutral_gray

function skill:can_play_card(card_name)
	-- card name is unknown (nil) if face down
	return not card_name
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	if cards.is_red(card_name) then
		return card_player_url
	else
		return opponent_url
	end
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	if cards.is_red(card_name) then
		local heal_amount = 0
		if cards.is_joker(card_name) then
			heal_amount = 999
		else
			heal_amount = cards.get_value(card_name)
		end
		skill_character_helpers.heal(card_player_url, heal_amount)
	else
		local damage = 0
		if cards.is_joker(card_name) then
			damage = 999
		else
			damage = cards.get_value(card_name)
		end
		skill_character_helpers.deal_damage(opponent_url, damage)
	end
end

return skill