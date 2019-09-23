local cards = require("card.cards")

local skill = {}

skill.description = "Test skill 1"
skill.requirements = "Jokers only"

function skill:can_play_card(card_name)
	return card_name and cards.is_joker(card_name)
end

function skill:execute(skill_script_component, card_name, showing_front)
	print("Executing test skill 1:", self, skill_script_component, card_name, showing_front)
end

return skill