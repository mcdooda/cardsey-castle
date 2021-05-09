local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Anti-conformism"
skill.description = "Discard a face-up face card from the opponent's hand"
skill.requirements = {"Numbers only"}
skill.color = skill_colors.damage

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_number(card_name))
end

function skill:prepare(cards_data, card_player_url, opponent_url, skill_id, decision)
	return opponent_url, true
end

function skill:execute(cards_data, card_player_url, opponent_url, skill_id, decision)
	skill_character_helpers.discard_faceup_card(opponent_url, { cards.jack, cards.queen, cards.king, cards.joker })
end

return skill