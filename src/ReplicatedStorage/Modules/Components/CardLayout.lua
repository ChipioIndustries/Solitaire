--used to lay out card piles in a row
--does not accept any custom props
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local CONFIG=require("CONFIG")

local CardLayout=Roact.Component:extend("CardLayout")

function CardLayout:render()
	return Roact.createElement("UIListLayout",{
		Padding=UDim.new(0,CONFIG.CardPadding);
		FillDirection=Enum.FillDirection.Horizontal;
		HorizontalAlignment=Enum.HorizontalAlignment.Center;
		VerticalAlignment=Enum.VerticalAlignment.Top;
		SortOrder=Enum.SortOrder.LayoutOrder;
	})
end

return CardLayout