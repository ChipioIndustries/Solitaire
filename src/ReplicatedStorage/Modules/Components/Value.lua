--a simple textlabel that shows a number or character in the corner of a card
--ChipioIndustries
--last edited 7/19/2020

--[[
	NOTABLE PROPS
	props are not applied directly to the label

	Card {
		int Value;
		Enum Suit;
	}
	Enum CardCorner - corner of the card to place value on
]]

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local Combine=require("Combine")
local Enums=require("Enums")
local CONFIG=require("CONFIG")

local positioning={
	[Enums.CardCorner.TopLeft]={
		Position=UDim2.new(0,0,0,0);
		AnchorPoint=Vector2.new(0,0);
	};
	[Enums.CardCorner.BottomRight]={
		Position=UDim2.new(1,0,1,0);
		AnchorPoint=Vector2.new(1,1);
	};
}

local Value=Roact.Component:extend("Value")

function Value:render(props)
	local color=CONFIG.Suits[props.Card.Suit].Color

	--replace the number with any specified character in the look-up table
	local LUTEntry=CONFIG.CardValueLUT[props.Card.Value]
	local char=tostring(props.Card.Value)
	if LUTEntry then
		char=LUTEntry.Character
	end

	return Roact.createElement("TextLabel",Combine({
		BackgroundTransparency=1;
		Font=Enum.Font.GothamBlack;
		Text=char;
		TextColor3=color;
		TextScaled=true;
		Size=UDim2.new(0,20,0,20);
		Image="rbxassetid://"..tostring(CONFIG.Suits[props.Suit].IconID);
		ScaleType=Enum.ScaleType.Fit;
	},positioning[props.CardCorner]))
end

return Value