--nothing yet
--ChipioIndustries
--last edit 7/19/2020

local require=require(game.ReplicatedStorage.Modules.Functions.Require)
local Rodux=require("Rodux")

return Rodux.createReducer(false,{
	SampleReducer=function(state,action)
		return action.enabled
	end
})