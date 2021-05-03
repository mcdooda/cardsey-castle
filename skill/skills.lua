local skills = {}

local function add_skill(name, module)
	skills[hash(name)] = module
end

add_skill("balance",     require("skill.skills.balance"))
add_skill("refresh",     require("skill.skills.refresh"))
add_skill("trick",       require("skill.skills.trick"))
add_skill("choose",      require("skill.skills.choose"))
add_skill("half",        require("skill.skills.half"))
add_skill("aristocracy", require("skill.skills.aristocracy"))
add_skill("knife",       require("skill.skills.knife"))
add_skill("opportunity", require("skill.skills.opportunity"))

add_skill("unplayable",  require("skill.skills.unplayable"))
add_skill("nothing",     require("skill.skills.nothing"))

return skills