-- UI/TopBar.luau
return function(ScreenGui)
    local CoinsLabel = Instance.new("TextLabel")
    CoinsLabel.Size=UDim2.new(0,260,0,60); CoinsLabel.Position=UDim2.new(0,16,0,16)
    CoinsLabel.BackgroundTransparency=1; CoinsLabel.TextColor3=Color3.fromRGB(255,230,150)
    CoinsLabel.TextStrokeTransparency=0.4; CoinsLabel.TextStrokeColor3=Color3.new(0,0,0)
    CoinsLabel.TextScaled=true; CoinsLabel.Font=Enum.Font.GothamBlack
    CoinsLabel.TextXAlignment=Enum.TextXAlignment.Left
    CoinsLabel.Text="🪙 0"; CoinsLabel.Parent=ScreenGui

    local StatsLabel = Instance.new("TextLabel")
    StatsLabel.Size=UDim2.new(0,260,0,30); StatsLabel.Position=UDim2.new(0,16,0,70)
    StatsLabel.BackgroundTransparency=1; StatsLabel.TextColor3=Color3.fromRGB(230,230,255)
    StatsLabel.TextStrokeTransparency=0.6; StatsLabel.TextStrokeColor3=Color3.new(0,0,0)
    StatsLabel.TextScaled=true; StatsLabel.Font=Enum.Font.GothamBold
    StatsLabel.TextXAlignment=Enum.TextXAlignment.Left
    StatsLabel.Text="Luck: 1x   •   Rolls: 0"; StatsLabel.Parent=ScreenGui

    return { CoinsLabel=CoinsLabel, StatsLabel=StatsLabel }
end