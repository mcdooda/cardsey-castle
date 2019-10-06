local characters = {}

local function add_character(name, health_points, skills)
	local character = {
		name = name,
		health_points = health_points,
		skills = skills
	}
	characters[hash(name)] = character
end

add_character("Player", 100, {
	hash("balance"),
	hash("refresh"),
	hash("choose"),
	hash("half"),
	hash("trick"),
	hash("aristocracy")
})
add_character("Enemy", 100, {
	hash("knife"),
	hash("refresh"),
	hash("choose"),
	hash("half"),
	hash("trick"),
	hash("aristocracy")
})

return characters