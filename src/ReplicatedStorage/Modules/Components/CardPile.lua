--used to create "piles" of card objects
--ChipioIndustries
--last edited 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Roact=require("Roact")
local Combine=require("Combine")
local CONFIG=require("CONFIG")

local CardPile=Roact.Component:extend("CardPile")

function CardPile:render()
    
end

return CardPile