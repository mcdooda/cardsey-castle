local cards = require("card.cards")

local skill = {}

skill.description = "Test skill 6"
skill.requirements = "Faces only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_face(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front)
	print("Executing test skill 6:", self, skill_script_component, card_name, showing_front)
end

return skill