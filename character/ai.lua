local cards = require("card.cards")
local skills = require("skill.skills")

local draw = hash("draw")
local flip_random_card = hash("flip_random_card")

local function get_unused_skills(self)
	local unused_skills = {}
	for i = 1, #self.skills do
		local skill_id = self.skills[i].skill_url
		if not go.get(skill_id, "used") then
			unused_skills[#unused_skills + 1] = skill_id
		end
	end
	return unused_skills
end

local function find_best_move(self)
	local unused_skills = get_unused_skills(self)
	local unused_skills_count = #unused_skills

	local cards = self.cards
	local cards_count = #self.cards

	local has_facedown_cards = false
	
	local skill_card_matches = {}
	for i = 1, unused_skills_count do
		local skill_id = unused_skills[i]
		local skill_name = go.get(skill_id, "skill_name")
		local skill = skills[skill_name]
		for j = 1, cards_count do
			local card_id = msg.url(nil, cards[j].path, "card")
			local card_name
			if go.get(card_id, "showing_front") then
				card_name = go.get(card_id, "card_name")
			else
				has_facedown_cards = true
			end
			for k = 1, #skill.requirements do
				if skill:can_play_card(card_name, k) then
					skill_card_matches[#skill_card_matches + 1] = {
						skill_id = skill_id,
						card_id = card_id,
						card_slot_index = k
					}
				end
			end
		end
	end

	if #skill_card_matches == 0 then
		if self.can_draw then
			return draw
		elseif has_facedown_cards and #unused_skills > 0 then
			return flip_random_card
		else
			return
		end
	end

	local random_combination_index = math.random(1, #skill_card_matches)
	return skill_card_matches[random_combination_index]
end

local function play_skill(skill_id, card_id, card_slot_index)
	local card = msg.url(nil, card_id.path, nil)
	msg.post(card, "drag")

	local skill = msg.url(nil, skill_id.path, nil)
	local skill_position = go.get_position(skill)
	assert(card_slot_index == 1, "multiple slots not supported yet!!")
	go.animate(card, "position.x", go.PLAYBACK_ONCE_FORWARD, skill_position.x, go.EASING_INBACK, 0.4)
	go.animate(card, "position.y", go.PLAYBACK_ONCE_FORWARD, skill_position.y, go.EASING_INBACK, 0.4, 0, function()
		msg.post(card, "drop")
	end)
end

return {
	-- special actions
	draw             = draw,
	flip_random_card = flip_random_card,

	-- functions
	find_best_move = find_best_move,
	play_skill     = play_skill
}