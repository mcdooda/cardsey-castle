local cards = require("card.cards")

local turn_animation_duration = 0.4

local function show_front(card_url, done)
	local card_script_url = msg.url(nil, card_url.path, "card")
	assert(not go.get(card_script_url, "animating"))
	go.set(card_script_url, "animating", true)
	local initial_scale = go.get(card_script_url, "initial_scale")
	local card_name_string = cards.get_string(go.get(card_script_url, "card_name"))
	go.animate(card_url, "scale", go.PLAYBACK_ONCE_FORWARD, initial_scale * 1.2, go.EASING_INSINE, turn_animation_duration * 0.5)
	go.animate("#sprite", "scale.x", go.PLAYBACK_ONCE_FORWARD, 0, go.EASING_INSINE, turn_animation_duration * 0.5, 0, function()
		sprite.play_flipbook("#sprite", card_name_string)
		go.set(card_script_url, "showing_front", true)
		go.animate(".", "scale", go.PLAYBACK_ONCE_FORWARD, initial_scale, go.EASING_OUTSINE, turn_animation_duration * 0.5)
		go.animate("#sprite", "scale.x", go.PLAYBACK_ONCE_FORWARD, 1, go.EASING_OUTSINE, turn_animation_duration * 0.5, 0, function()
			if done then
				done()
			end
			go.set(card_script_url, "animating", false)
		end)
	end)
end

return {
	show_front = show_front
}