local function get_character_script_url(character_url)
	return msg.url(nil, character_url.path, "character")
end

local function get_health_points(character_url)
	return go.get(get_character_script_url(character_url), "health_points")
end

local function set_health_points(character_url, health_points)
	return msg.post(get_character_script_url(character_url), "set_health_points", { health_points = health_points })
end

local function deal_damage(character_url, amount)
	return msg.post(get_character_script_url(character_url), "deal_damage", { amount = amount })
end

local function heal(character_url, amount)
	return msg.post(get_character_script_url(character_url), "heal", { amount = amount })
end

local function draw(character_url, amount)
	msg.post(get_character_script_url(character_url), "draw", { amount = amount })
end

local function reload_used_skill(character_url, ignore_skill_id)
	msg.post(get_character_script_url(character_url), "reload_used_skill", { ignore_skill_id = ignore_skill_id })
end

local function destroy_faceup_card(character_url)
	msg.post(get_character_script_url(character_url), "destroy_faceup_card")
end

return {
	get_health_points   = get_health_points,
	set_health_points   = set_health_points,
	deal_damage         = deal_damage,
	heal                = heal,
	draw                = draw,
	reload_used_skill   = reload_used_skill,
	destroy_faceup_card = destroy_faceup_card
}