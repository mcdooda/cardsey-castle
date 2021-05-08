local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Refresh memory"
skill.description = "Refresh a used skill"
skill.requirements = {"Diamonds only"}
skill.color = skill_colors.heal

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_diamonds(card_name))
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return card_player_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.reload_used_skill(card_player_url, skill_id)
end

return skill