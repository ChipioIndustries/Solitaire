--[[
	ChipioIndustries
	last edited 7/19/2020
	used to create "piles" of card components

	NOTABLE PROPS

	Card: {
		int Value
		Enum Suit
	}

	string PileAddress - should be identical to the address of the pile in the Rodux store
	Enum Facing - direction the cards should be facing
	Enum Spread - the way the pile of cards spread
]]

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local RoactRodux=require("RoactRodux")
local Card=require("Card")
local Enums=require("Enums")
local Combine=require("Combine")
local CONFIG=require("CONFIG")

local spreadOptions={
	[Enums.CardSpread.None]=UDim2.new(0,0,0,0);
	[Enums.CardSpread.Down]=UDim2.new(0,0,0,10);
}

local CardPile=Roact.Component:extend("CardPile")

function CardPile:render(props)
	local spread=spreadOptions[props.Spread or Enums.CardSpread.None]
	--each card is nested inside of the previous one to make for easier manipulation and effects display.
	local topElement
	for index,cardInfo in pairs(props.Pile) do 
		topElement=Roact.createElement(Card,{
			BackgroundProps={
				Position=spread;
			};
			Facing=props.Facing;
			Card=cardInfo;
		},{topElement})
	end
	return Roact.createElement("ImageButton",{
		Size=UDim2.new(0,CONFIG.CardSize.X,0,CONFIG.CardSize.Y);
		BackgroundTransparency=0.5;
		BackgroundColor3=Color3.new(0,0,0);
	},{topElement})
end

--[[
	RoactRodux's behavior is super weird. Essentially, its "connect" function behaves as a wrapper for the Roact element, and it's
	supposed to be called with the function that creates the elements. However, Component:render() is a method, not a function, so we
	have to do this bizaare and annoying super-wrapping behavior where we have a wrapper for the wrapper. Something tells me RoactRodux
	hasn't been updated since a very early version of Roact.
]]

function CardPileWrapper(props)
	return CardPile:render(props)
end

CardPileWrapper=RoactRodux.connect(function(state,props)
	return Combine({
			Pile=state[props.PileAddress] or {} --replace the pile address with the actual pile
		},props)
end)(CardPileWrapper)

return CardPileWrapper