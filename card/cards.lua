local red = hash("red")
local black = hash("black")

local hearts = hash("hearts")
local diamonds = hash("diamonds")
local clover = hash("clover")
local pikes = hash("pikes")

local jack = 11
local queen = 12
local king = 13

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
		local value = 10 + i
		local card_str = get_card_string(suit, face)
		cards[hash(card_str)] = {
			color = color_hash,
			suit = suit_hash,
			value = value,
			string = card_str,
			name = face .. " of " .. suit
		}
	end
end

add_suit("Hearts")
add_suit("Diamonds")
add_suit("Clover")
add_suit("Pikes")

cards.red = red
cards.black = black

cards.hearts = hearts
cards.diamonds = diamonds
cards.clover = clover
cards.pikes = pikes

cards.get_card_string = get_card_string
cards.get_card_hash = get_card_hash

-- value
function cards.get_value(card_name)
	return cards[card_name].value
end

function cards.is_joker(card_name)
	return cards.get_value(card_name) == joker
end

function cards.is_jack(card_name)
	return cards.get_value(card_name) == jack
end

function cards.is_queen(card_name)
	return cards.get_value(card_name) == queen
end

function cards.is_king(card_name)
	return cards.get_value(card_name) == king
end

function cards.is_number(card_name)
	local value = cards.get_value(card_name)
	return value ~= joker and 1 <= value and value <= 10
end

function cards.is_face(card_name)
	local value = cards.get_value(card_name)
	return value ~= joker and jack <= value and value <= king
end

function cards.is_ace(card_name)
	return cards.get_value(card_name) == 1
end

-- suit
function cards.is_suit(card_name, suit)
	return cards[card_name].suit == suit
end

function cards.is_hearts(card_name)
	return cards.is_suit(card_name, hearts)
end

function cards.is_diamonds(card_name)
	return cards.is_suit(card_name, diamonds)
end

function cards.is_clover(card_name)
	return cards.is_suit(card_name, clover)
end

function cards.is_pikes(card_name)
	return cards.is_suit(card_name, pikes)
end

return cards