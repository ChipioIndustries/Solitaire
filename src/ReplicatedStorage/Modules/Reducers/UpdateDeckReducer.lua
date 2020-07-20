--update the rodux store to hold the latest deck contents
--ChipioIndustries
--last edit 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Rodux=require("Rodux")

return Rodux.createReducer({},{
	UpdateDeck=function(state,action)
		return action.Deck
	end
})