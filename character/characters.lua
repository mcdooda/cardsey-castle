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
	--"balance",
	"opportunity",
	"trick",
	"choose",
	"half",
	"refresh",
	"aristocracy"
})
add_character("Enemy", 100, {
	"aristocracy",
	"refresh",
	"choose",
	"half",
	"knife",
	"trick",
})

return characters