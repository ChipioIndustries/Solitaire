---a card that can be clicked and whatnot
--ChipioIndustries
--last edited 7/19/2020

--[[
	NOTABLE PROPS

	Dictionary BackgroundProps: props to apply to the card
	I wish there was a way to pass non-property props down without
	having to segment them like this. It's kind of a headache but if
	there's a better way of doing this, I don't know it.
	
	Card: {
		int Value
		Enum Suit
	}
	Enum Facing - the direction the card is facing
]]

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local Combine=require("Combine")
local CONFIG=require("CONFIG")
local Value=require("Value")
local Enums=require("Enums")

local Card=Roact.Component:extend("Card")

function Card:render(props)
	local values
	if props.Facing==Enums.Facing.Up then --no need to generate numbers if card is facing down
		values={
			TopLeftValue=Roact.createElement(Value,{
				Card=props.Card;
				CardCorner=Enums.CardCorner.TopLeft;
			});
			BottomRightValue=Roact.createElement(Value,{
				Card=props.Card;
				CardCorner=Enums.CardCorner.BottomRight;
			});
		}
	end

	return Roact.createElement("ImageButton",Combine({
		Size=UDim2.new(0,CONFIG.CardSize.X,0,CONFIG.CardSize.Y);
		BackgroundColor3=Color3.new(1,1,1);
	},props.BackgroundProps),Combine({
		Corner=Roact.createElement("UICorner",{
			CornerRadius=UDim.new(0,12);
		});
	},values))
end

return Card