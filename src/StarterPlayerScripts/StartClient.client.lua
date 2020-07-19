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

local app=Roact.createElement(RoactRodux.StoreProvider,{ --create the UI, wrapped in a roact-rodux bridge
    store=store;
},{
    Main=Roact.createElement(Interface);
})

app.mount(app,playerGui) --no need to save the handle, it's never gonna be unmounted

game.StarterGui:SetCoreGuiEnabled("All",false) --no need for the core gui
