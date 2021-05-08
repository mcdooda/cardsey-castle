local characters = {}

local function add_character(name, health_points, skills)
	for i = 1, #skills do
		skills[i] = hash(skills[i])
	end
	local character = {
		name = name,
		health_points = health_points,
		skills = skills
	}
	characters[hash(name)] = character
end

add_character("Player", 100, {
	"face_value",
	"value_of_nothing",
	"choose_your_weapon",
	"half_measures",
	--"refresh_memory",
	--"codfish_aristocracy",
	"it_takes_two_to_tango",
})
add_character("Enemy", 100, {
	"codfish_aristocracy",
	"refresh_memory",
	"choose_your_weapon",
	"half_measures",
	"twist_the_knife",
	"trick_or_treat",
})

return characters