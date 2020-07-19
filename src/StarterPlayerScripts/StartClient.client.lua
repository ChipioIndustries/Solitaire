--let's get this party started!
--ChipioIndustries
--last edit 7/19/2020

--interface
local player=game.Players.LocalPlayer
local playerGui=player:WaitForChild("PlayerGui")

--modules
local require=require(game.ReplicatedStorage.Modules.Functions.Require) --overwrite the dumb stupid baby vanilla require function with our super cool one
local Roact=require("Roact")
local RoactRodux=require("RoactRodux")
local Interface=require("Interface")
local Rodux=require("Rodux")

local store=Rodux.Store.new()

local app=Roact.createElement(RoactRodux.StoreProvider,{ --create the UI, wrapped in a roact-rodux bridge
    store=store;
},{
    Main=Roact.createElement(Interface);
})

app.mount(app,playerGui) --no need to save the handle, it's never gonna be unmounted

game.StarterGui:SetCoreGuiEnabled("All",false) --no need for the core gui
