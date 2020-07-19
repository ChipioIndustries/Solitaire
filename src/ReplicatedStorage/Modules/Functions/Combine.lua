--combine two dictionaries into one
--first dictionary takes priority
--ChipioIndustries
--last edited 7/19/2020

return function(dict1,dict2)
    for i,v in pairs(dict2) do
        dict1[i]=dict1[i] or v
    end
    return dict1
end