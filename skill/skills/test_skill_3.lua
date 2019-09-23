local cards = require("card.cards")

local skill = {}

skill.description = "Test skill 3"
skill.requirements = "Face down cards only"

function skill:can_play_card(card_name)
	return not card_name
end

function skill:execute(skill_script_component, card_name, showing_front)
	print("Executing test skill 3:", self, skill_script_component, card_name, showing_front)
end

return skill