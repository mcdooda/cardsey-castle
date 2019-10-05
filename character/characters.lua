local characters = {}

local function add_character(name, health_points, skills)
	local character = {
		name = name,
		health_points = health_points,
		skills = skills
	}
	characters[hash(name)] = character
end

add_character("Player", 20, {
	hash("test_skill_1"),
	hash("test_skill_2"),
	hash("test_skill_3"),
	hash("test_skill_4"),
	hash("test_skill_5"),
	hash("test_skill_6")
})
add_character("Enemy", 20, {
	hash("test_skill_4"),
	hash("test_skill_5")
})

return characters