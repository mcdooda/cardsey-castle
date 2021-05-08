local skills = {}

local function add_skill(name, module)
	skills[hash(name)] = module
end

-- debug skills
add_skill("unplayable", require("skill.skills.unplayable"))

-- actually useful skills
add_skill("balance_is_the_key",    require("skill.skills.balance_is_the_key"))
add_skill("refresh_memory",        require("skill.skills.refresh_memory"))
add_skill("trick_or_treat",        require("skill.skills.trick_or_treat"))
add_skill("choose_your_weapon",    require("skill.skills.choose_your_weapon"))
add_skill("half_measures",         require("skill.skills.half_measures"))
add_skill("codfish_aristocracy",   require("skill.skills.codfish_aristocracy"))
add_skill("twist_the_knife",       require("skill.skills.twist_the_knife"))
add_skill("golden_opportunity",    require("skill.skills.golden_opportunity"))
add_skill("here_goes_nothing",     require("skill.skills.here_goes_nothing"))
add_skill("face_value",            require("skill.skills.face_value"))
add_skill("value_of_nothing",      require("skill.skills.value_of_nothing"))
add_skill("a_dime_a_dozen",        require("skill.skills.a_dime_a_dozen"))
add_skill("it_takes_two_to_tango", require("skill.skills.it_takes_two_to_tango"))

return skills