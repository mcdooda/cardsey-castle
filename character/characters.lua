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

-- level 1
add_character("Player-1", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"doctor_up",
	"doctor_up",
})

add_character("Enemy-1", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
})

-- level 2
add_character("Player-2", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"refresh_memory",
	"refresh_memory",
})

add_character("Enemy-2", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"refresh_memory",
	"refresh_memory",
})

-- level 3
add_character("Player-3", 100, {
	"it_takes_two_to_tango",
	"cook_the_books",
	"cook_the_books",
	"share_and_share_alike",
	"labour_of_love",
})

add_character("Enemy-3", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"refresh_memory",
	"anti_conformism",
})

-- level 4
add_character("Player-4", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
})

add_character("Enemy-4", 100, {
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
	"choose_your_weapon",
})

return characters