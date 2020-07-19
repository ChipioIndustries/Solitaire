--a simple textlabel that shows a number or character
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local Combine=require("Combine")
local Enums=require("Enums")

local Value=Roact.Component:extend("Value")

function Value:render(props)
	
	return Roact.createElement("ImageLabel",Combine(Combine({
		Size=UDim2.new(0,20,0,20);
		Image="rbxassetid://"..tostring(CONFIG.Suits[props.Suit].IconID);
		ScaleType=Enum.ScaleType.Fit;
	},props),{
		AnchorPoint=Vector2.new(0.5,0.5);
		BackgroundTransparency=1;
	}))
end

return Value