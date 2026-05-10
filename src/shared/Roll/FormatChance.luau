-- Roll/FormatChance.luau
return function(baseChance, luckMultiplier)
    luckMultiplier = luckMultiplier or 1.0
    local effective = baseChance * luckMultiplier
    if effective <= 0 then return "???" end
    return "1/" .. tostring(math.max(math.floor(1 / effective), 1))
end