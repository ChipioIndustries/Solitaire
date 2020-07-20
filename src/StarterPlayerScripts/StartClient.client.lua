--[[
	Let's get this party started!

	The primary job of this script is to initialize everything on the client. It requires all of the essential modules,
	initializes the deck of cards (using OOP winkwink), combines all of the store reducers and creates the Rodux store,
	and mounts the interface.
]]
--ChipioIndustries
--last edit 7/19/2020

--interface
local player=game.Players.LocalPlayer
local playerGui=player:WaitForChild("PlayerGui")

--modules
local require=require(game.ReplicatedStorage.Modules.Functions.Require) --overwrite the vanilla require function with our super cool one that just takes a name instead of a path
local Roact=require("Roact")
local RoactRodux=require("RoactRodux")
local Interface=require("Interface")
local Rodux=require("Rodux")
local Deck=require("Deck").new()
local UpdateDeck=require("UpdateDeckAction")

--reducers
local reducerModules=game.ReplicatedStorage.Modules.Reducers
local reducers={}
for index,module in pairs(reducerModules:GetDescendants()) do
	if module:IsA("ModuleScript") then
		reducers[module.Name]=require(module)
	end
end
local reducer=Rodux.combineReducers(reducers)
local store=Rodux.Store.new(reducer,{},{Rodux.loggerMiddleware})

store:dispatch(UpdateDeck(Deck))

local app=Roact.createElement(RoactRodux.StoreProvider,{ --create the UI, wrapped in a roact-rodux bridge
	store=store;
},{
	Main=Roact.createElement(Interface);
})

Roact.setGlobalConfig({ --just a thing to make Roact errors actually understandable
	elementTracing=true;
})

Roact.mount(app,playerGui) --no need to save the handle, it's never gonna be unmounted

game.StarterGui:SetCoreGuiEnabled("All",false) --no need for the core gui
