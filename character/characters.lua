local characters = {}

local function add_character(name, health_points)
	local character = {
		name = name,
		health_points = health_points
	}
	characters[hash(name)] = character
end

add_character("Player", 20)
add_character("Enemy", 20)

return characters