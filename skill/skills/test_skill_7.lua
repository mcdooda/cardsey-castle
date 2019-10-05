local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")

local skill = {}

skill.description = "Destroy a face-up card from the opponent's hand"
skill.requirements = ""

function skill:can_play_card(card_name)
	return true
end

function skill:execute(skill_script_component, card_name, showing_front, card_player_url, opponent_url, skill_id)
	skill_character_helpers.destroy_faceup_card(opponent_url)
end

return skill