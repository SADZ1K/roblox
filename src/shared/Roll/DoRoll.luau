-- Roll/DoRoll.luau
local Items = require(script.Parent.Parent.Config.Items)

return function(luckMultiplier)
    luckMultiplier = luckMultiplier or 1.0
    for i = #Items, 1, -1 do
        local item = Items[i]
        local effectiveChance = math.min(item.chance * luckMultiplier, 1)
        if math.random() <= effectiveChance then
            return item, effectiveChance
        end
    end
    return nil, 0
end