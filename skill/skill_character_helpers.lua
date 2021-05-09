local function get_character_script_url(character_url)
	return msg.url(nil, character_url.path, "character")
end

local function post_skill(character_url, name, params)
	msg.post(get_character_script_url(character_url), name, params)
end

local function get_health_points(character_url)
	return go.get(get_character_script_url(character_url), "health_points")
end

local function set_health_points(character_url, health_points)
	post_skill(character_url, "set_health_points", { health_points = health_points })
end

local function deal_damage(character_url, amount)
	post_skill(character_url, "deal_damage", { amount = amount })
end

local function heal(character_url, amount)
	post_skill(character_url, "heal", { amount = amount })
end

local function draw(character_url, amount)
	post_skill(character_url, "draw", { amount = amount })
end

local function reload_used_skill(character_url, ignore_skill_id)
	post_skill(character_url, "reload_used_skill", { ignore_skill_id = ignore_skill_id })
end

local function discard_faceup_card(character_url, values)
	post_skill(character_url, "discard_faceup_card", { values = values })
end

local function discard_stack_cards_of_suits(character_url, suits)
	post_skill(character_url, "discard_stack_cards_of_suits", { suits = suits })
end

local function discard_stack_cards_of_lesser_value(character_url, max_value)
	post_skill(character_url, "discard_stack_cards_of_lesser_value", { max_value = max_value })
end

local function discard_stack_cards_of_equal_value(character_url, value)
	post_skill(character_url, "discard_stack_cards_of_equal_value", { value = value })
end

local function shuffle_into_deck(character_url, card_ids)
	post_skill(character_url, "shuffle_into_deck", { card_ids = card_ids })
end

return {
	get_health_points                   = get_health_points,
	set_health_points                   = set_health_points,
	deal_damage                         = deal_damage,
	heal                                = heal,
	draw                                = draw,
	reload_used_skill                   = reload_used_skill,
	discard_faceup_card                 = discard_faceup_card,
	discard_stack_cards_of_suits        = discard_stack_cards_of_suits,
	discard_stack_cards_of_lesser_value = discard_stack_cards_of_lesser_value,
	discard_stack_cards_of_equal_value  = discard_stack_cards_of_equal_value,
	shuffle_into_deck                   = shuffle_into_deck,
}