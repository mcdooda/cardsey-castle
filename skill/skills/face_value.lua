local cards = require("card.cards")
local skill_character_helpers = require("skill.skill_character_helpers")
local skill_colors = require("skill.skill_colors")

local skill = {}

skill.name = "Face value"
skill.description = "Discard all cards from the given suit from your stack"
skill.requirements = {"Faces only"}
skill.color = skill_colors.heal

function skill:can_play_card(card_name)
	return card_name and (cards.is_joker(card_name) or cards.is_face(card_name))
end

function skill:prepare(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	return card_player_url
end

function skill:execute(card_name, showing_front, card_player_url, opponent_url, skill_id, decision)
	local suits_to_discard
	if cards.is_joker(card_name) then
		if cards.is_red(card_name) then
			suits_to_discard = { cards.hearts, cards.diamonds }
		else
			assert(cards.is_black(card_name))
			suits_to_discard = { cards.clover, cards.pikes }
		end
	else
		suits_to_discard = { cards.get_suit(card_name) }
	end
	assert(suits_to_discard and #suits_to_discard > 0)
	skill_character_helpers.discard_stack_cards_of_suits(card_player_url, suits_to_discard)
end

return skill