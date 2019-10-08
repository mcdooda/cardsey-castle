local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.name = "Unplayable"
skill.description = "You can't play it anyway"
skill.requirements = "No card works here"

function skill:can_play_card(card_name)
	return false
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	error("Cannot prepare this skill")
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	error("Cannot execute this skill")
end

return skill