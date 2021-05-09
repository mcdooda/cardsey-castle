local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Here goes nothing"
skill.description = "Only throws the card away"
skill.requirements = {""}
skill.color = skill_colors.neutral

function skill:can_play_card(card_name)
	return true
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return card_player_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)

end

return skill