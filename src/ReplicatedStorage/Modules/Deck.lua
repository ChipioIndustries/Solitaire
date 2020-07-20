---a deck of cards that can be shuffled and flipped through
--ChipioIndustries
--last edited 7/19/2020

--[[
	USAGE

	Deck Deck.new() - returns a new shuffled deck
	table Deck:TakeTopCards(int amount) - returns the requested amount of cards from the top, removing them from the deck. May return less than expected or even none.
	void Deck:AddBottomCards(table cards) - sequentially adds the list of cards to the end of the deck

	CARD PROPS
	Card {
		int Value - the numeric value of the card
		Enum Suit - the card's suit
	}
]]

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local CONFIG=require("CONFIG")
local RNG=Random.new(tick()/10)

local Deck={}
Deck.__index=Deck

function Deck.new()
	local cards={}
	for suit,info in pairs(CONFIG.Suits) do
		for value=1,CONFIG.HighestCardValue do
			local card={
				Value=value;
				Suit=suit;
			}
			table.insert(cards,RNG:NextInteger(1,#cards+1),card)
		end
	end
	local self=setmetatable({
		Cards=cards;
	},Deck)
	return self
end

function Deck:TakeTopCards(amount)
	local cards={}
	for i=1,amount do
		cards[i]=self.Cards[i]
	end
	for i=1,amount do
		table.remove(self.Cards,i)
	end
	return cards
end

function Deck:AddBottomCards(cards)
	local ending=#self.Cards
	for index,card in pairs(cards) do
		self.Cards[index+ending]=card
	end
end

return Deck