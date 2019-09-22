local skills = {}

skills[hash("test_skill_1")] = require("skill.skills.test_skill_1")
skills[hash("test_skill_2")] = require("skill.skills.test_skill_2")
skills[hash("test_skill_3")] = require("skill.skills.test_skill_3")
skills[hash("test_skill_4")] = require("skill.skills.test_skill_4")
skills[hash("test_skill_5")] = require("skill.skills.test_skill_5")
skills[hash("test_skill_6")] = require("skill.skills.test_skill_6")

return skills