-- Remotes/Setup.luau
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
if not Remotes then
    Remotes = Instance.new("Folder")
    Remotes.Name   = "Remotes"
    Remotes.Parent = ReplicatedStorage
end

local function getOrCreate(name, className)
    return Remotes:FindFirstChild(name) or (function()
        local r = Instance.new(className)
        r.Name = name; r.Parent = Remotes
        return r
    end)()
end

return {
    RollFunction     = getOrCreate("RollFunction",     "RemoteFunction"),
    UpdateDataEvent  = getOrCreate("UpdateDataEvent",  "RemoteEvent"),
    GetDataFunction  = getOrCreate("GetDataFunction",  "RemoteFunction"),
    BuyBoostFunction = getOrCreate("BuyBoostFunction", "RemoteFunction"),
}