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
	"it_takes_two_to_tango",
	"cook_the_books",
	"cook_the_books",
	"share_and_share_alike",
	"labour_of_love",
})

add_character("Enemy", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"refresh_memory",
	"anti_conformism",
})

return characters