--primary interface component
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local CONFIG=require("CONFIG")

local Interface=Roact.Component:extend("Interface")

function Interface:render()
    return Roact.createElement("ScreenGui",{
        Name="Interface";
        ResetOnSpawn=false;
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
    },{
        Background=Roact.createElement("Frame",{
            Name="Background";
            Size=UDim2.new(1,0,1,0);
            BorderSizePixel=50;
            BackgroundColor3=Color3.fromRGB(100,200,100);
            BorderColor3=Color3.fromRGB(100,200,100);
        },{
            Row=Roact.createElement("Frame",{
                Name="Row";
                Size=UDim2.new(1,0,0,CONFIG.CardSize.Y);
                AnchorPoint=Vector2.new(0.5,0.5);
                Position=UDim2.new(0.5,0,0.25,0);
                BackgroundTransparency=1;
            },{
                Layout=Roact.createElement("UIListLayout",{
                    Padding=Vector2.new(0,8);
                    FillDirection=Enum.FillDirection.Horizontal;
                    HorizontalAlignment=Enum.HorizontalAlignment.Center;
                    VerticalAlignment=Enum.VerticalAlignment.Top;
                    SortOrder=Enum.SortOrder.LayoutOrder;
                });
                --TODO: card piles
            })
        })
    })
end