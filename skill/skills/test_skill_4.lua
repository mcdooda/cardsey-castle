local cards = require("card.cards")

local skill = {}

skill.description = "Test skill 4"
skill.requirements = "Numbers only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front)
	print("Executing test skill 4:", self, skill_script_component, card_name, showing_front)
end

return skill