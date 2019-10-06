local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.name = "Codfish aristocracy"
skill.description = "Draw 3 cards\n(no hand limit)"
skill.requirements = "Faces only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_face(card_name))
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return card_player_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.draw(card_player_url, 3)
end

return skill