local function get_unused_skills(self)
	local unused_skills = {}
	for i = 1, #self.skills do
		local skill = self.skills[i].skill_url
		if not go.get(skill, "used") then
			unused_skills[#unused_skills + 1] = skill
		end
	end
	return unused_skills
end

local function play(self)
	return false
end

return {
	play = play
}