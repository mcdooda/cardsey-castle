local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.name = "Here goes nothing"
skill.description = "Only throws the card away"
skill.requirements = ""

function skill:can_play_card(card_name)
	return true
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return card_player_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)

end

return skill