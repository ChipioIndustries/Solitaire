--primary interface component
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local CardPile=require("CardPile")
local CardLayout=require("CardLayout")
local Combine=require("Combine")
local CONFIG=require("CONFIG")

local Interface=Roact.Component:extend("Interface")

function Interface:render()
	local primaryPiles={} --create the pile elements ahead of time
	for index=1,CONFIG.Piles do
		primaryPiles["Pile"..tostring(index)]=Roact.createElement(CardPile)
	end

	local completedPiles={}
	for index=1,4 do
		completedPiles["Pile"..index]=Roact.createElement(CardPile)
	end

	return Roact.createElement("ScreenGui",{
		Name="Interface";
		ResetOnSpawn=false;
		ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
	},{
		Background=Roact.createElement("Frame",{ --this is just gonna be a bunch of boring wrapper containers, nothing to see here
			Size=UDim2.new(1,0,1,0);
			BorderSizePixel=50;
			BackgroundColor3=Color3.fromRGB(100,200,100);
			BorderColor3=Color3.fromRGB(100,200,100);
		},{
			Completed=Roact.createElement("Frame",{ --completed card piles (starting with the aces and such, I dunno what the proper terminology is)
				AnchorPoint=Vector2.new(0.5,0);
				Position=UDim2.new(0.5,0,0,20);
				BackgroundTransparency=1;
				Size=UDim2.new(1,0,0,CONFIG.CardSize.Y);
			},Combine({Layout=Roact.createElement(CardLayout)},completedPiles)),
			Row=Roact.createElement("Frame",{ --main row of cards where some are covered up and some aren't
				Size=UDim2.new(1,0,0,CONFIG.CardSize.Y);
				AnchorPoint=Vector2.new(0.5,0.5);
				Position=UDim2.new(0.5,0,0.5,0);
				BackgroundTransparency=1;
			},Combine({Layout=Roact.createElement(CardLayout)},primaryPiles)), --combine the card piles with the layout before passing them all as children
			DeckFrame=Roact.createElement("Frame",{ --flip-by-three deck container
				BackgroundTransparency=1;
				Position=UDim2.new(0.5,0,0.75,0);
				AnchorPoint=Vector2.new(0.5,0.5);
				Size=UDim2.new(0,CONFIG.CardSize.X*2+CONFIG.CardPadding,0,CONFIG.CardSize.Y);
			},{
				Layout=Roact.createElement(CardLayout);
				Deck=Roact.createElement(CardPile);
				Flipped=Roact.createElement(CardPile);
			})
		})
	})
end

return Interface