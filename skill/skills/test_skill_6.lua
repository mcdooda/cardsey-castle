local cards = require("card.cards")

local skill = {}

skill.description = "Draw 3 cards\n(no hand limit)"
skill.requirements = "Faces only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_face(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url)
	-- TODO: draw on card_player_url's hand
	msg.post("/deck", "draw", { amount = 3 })
end

return skill