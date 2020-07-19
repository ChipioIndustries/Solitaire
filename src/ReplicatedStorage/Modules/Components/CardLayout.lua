--used to lay out card piles in a row
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local CONFIG=require("CONFIG")

local CardLayout=Roact.Component:extend("CardLayout")

function CardLayout:render()
    return Roact.createElement("UIListLayout",{
        Padding=Vector2.new(0,CONFIG.CardPadding);
        FillDirection=Enum.FillDirection.Horizontal;
        HorizontalAlignment=Enum.HorizontalAlignment.Center;
        VerticalAlignment=Enum.VerticalAlignment.Top;
        SortOrder=Enum.SortOrder.LayoutOrder;
    })
end

return CardLayout