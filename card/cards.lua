local red = hash("red")
local black = hash("black")

local hearts = hash("hearts")
local diamonds = hash("diamonds")
local clover = hash("clover")
local pikes = hash("pikes")

local jack = hash("jack")
local queen = hash("queen")
local king = hash("king")
local joker = hash("joker")

local cards = {
	[hash("red-joker")] = {
		color = red,
		value = joker,
		string = "red-joker",
		name = "Red Joker"
	},
	[hash("black-joker")] = {
		color = black,
		value = joker,
		string = "black-joker",
		name = "Black Joker"
	},
}

local suit_to_color = {
	[hearts] = red,
	[diamonds] = red,
	[clover] = black,
	[pikes] = black
}

local function get_card_string(suit, value)
	return string.lower(suit) .. "-" .. string.lower(tostring(value))
end

local function get_card_hash(suit, value)
	return hash(get_card_string(suit, value))
end

local function get_suit_hash(suit)
	return hash(string.lower(suit))
end

local function add_suit(suit)
	local suit_hash = get_suit_hash(suit)
	local color_hash = suit_to_color[suit_hash]
	
	for i = 1, 10 do
		local card_str = get_card_string(suit, i)
		cards[hash(card_str)] = {
			color = color_hash,
			suit = suit_hash,
			value = i,
			string = card_str,
			name = tostring(i) .. " of " .. suit
		}
	end

	local faces = {"Jack", "Queen", "King"}
	for i = 1, #faces do
		local face = faces[i]
		local card_str = get_card_string(suit, face)
		cards[hash(card_str)] = {
			color = color_hash,
			suit = suit_hash,
			value = hash(face),
			string = card_str,
			name = face .. " of " .. suit
		}
	end
end

add_suit("Hearts")
add_suit("Diamonds")
add_suit("Clover")
add_suit("Pikes")

--pprint(cards)

cards.red = red
cards.black = black

cards.hearts = hearts
cards.diamonds = diamonds
cards.clover = clover
cards.pikes = pikes

cards.get_card_string = get_card_string
cards.get_card_hash = get_card_hash

local function is_joker(card_hash)
	return cards[card_hash].value == joker
end

cards.is_joker = is_joker

return cards