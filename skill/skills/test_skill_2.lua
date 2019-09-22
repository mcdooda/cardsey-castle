local cards = require("card.cards")

local skill = {}

skill.description = "Test skill 2"
skill.requirements = "Diamonds only"

function skill:can_play_card(card_name, showing_front)
	return (cards.is_joker(card_name) or cards.is_diamonds(card_name)) and showing_front
end

function skill:execute(skill_script_component, card_name, showing_front)
	print("Executing test skill 2:", self, skill_script_component, card_name, showing_front)
end

return skill