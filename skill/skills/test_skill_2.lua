local cards = require("card.cards")

local skill = {}

skill.description = "Reload a used skill"
skill.requirements = "Diamonds only"

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_diamonds(card_name))
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url, skill_id)
	print("Executing test skill 2:", self, skill_script_component, card_name, showing_front, skill)
	msg.post(card_player_url, "reload_used_skill", { ignore_skill = skill_id })
end

return skill