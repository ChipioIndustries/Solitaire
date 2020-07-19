--a card that can be clicked and whatnot
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local Combine=require("Combine")
local CONFIG=require("CONFIG")

local Card=Roact.Component:extend("Card")

function Card:render(props)
	return Roact.createElement("ImageButton",Combine({

	},props.BackgroundProps),{
		Corner=Roact.createElement("UICorner",{
			CornerRadius=UDim.new(0,12);
		})
	})
end

return Card