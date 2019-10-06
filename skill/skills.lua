local skills = {}

skills[hash("balance")] = require("skill.skills.balance")
skills[hash("refresh")] = require("skill.skills.refresh")
skills[hash("trick")] = require("skill.skills.trick")
skills[hash("choose")] = require("skill.skills.choose")
skills[hash("half")] = require("skill.skills.half")
skills[hash("aristocracy")] = require("skill.skills.aristocracy")
skills[hash("knife")] = require("skill.skills.knife")

return skills