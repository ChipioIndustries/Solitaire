--a deck of cards that can be shuffled and flipped through
--ChipioIndustries
--last edited 7/19/2020

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

return Deck