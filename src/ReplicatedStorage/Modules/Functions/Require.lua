--ChipioIndustries
--last edit 7/19/2020
--require a module by its name as opposed to its full path.
--in order for this to work properly, all modules you intend to
--require must be uniquely named. You might run into conflicts otherwise.

local rs=game:GetService("RunService")
local sources={game.ReplicatedStorage}
local cache={}

--add network-limited sources
if rs:IsServer() then
    table.insert(sources,game.ServerScriptService)
elseif rs:IsClient() then
    table.insert(sources,game.Players.LocalPlayer.PlayerScripts)
end

return function(moduleName)
    if typeof(moduleName)=="string" then
        if cache[moduleName] then
            return require(cache[moduleName]) --don't bother searching if cached
        end
        for _,source in pairs(sources) do --scan through all source objects
            for index,object in pairs(source:GetDescendants()) do
                if object:IsA("ModuleScript") then
                    if not cache[object.Name] then
                        cache[object.Name]=object --add to cache if not already there
                    end
                    if object.Name==moduleName then
                        return require(object) --if the name is correct, require it
                    end
                end
            end
        end
    elseif typeof(moduleName)=="Instance" then --will also behave like the normal require function if it receives a module object
        return require(moduleName)
    end
end