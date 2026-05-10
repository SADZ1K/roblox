-- UI/ResultPanel.luau
return function(ScreenGui)
    local panel=Instance.new("Frame")
    panel.Size=UDim2.new(1,0,1,0); panel.BackgroundColor3=Color3.fromRGB(0,0,0)
    panel.BackgroundTransparency=1; panel.Visible=false; panel.ZIndex=100; panel.Parent=ScreenGui

    local OneInLabel=Instance.new("TextLabel")
    OneInLabel.Size=UDim2.new(0.7,0,0,90); OneInLabel.Position=UDim2.new(0,10,1,-160)
    OneInLabel.BackgroundTransparency=1; OneInLabel.TextColor3=Color3.fromRGB(255,255,255)
    OneInLabel.TextStrokeTransparency=0; OneInLabel.TextStrokeColor3=Color3.fromRGB(0,0,0)
    OneInLabel.TextScaled=true; OneInLabel.Font=Enum.Font.GothamBlack
    OneInLabel.TextXAlignment=Enum.TextXAlignment.Left
    OneInLabel.Text="1 in 2"; OneInLabel.ZIndex=101; OneInLabel.Parent=panel

    local ItemResultName=Instance.new("TextLabel")
    ItemResultName.Size=UDim2.new(0.7,0,0,50); ItemResultName.Position=UDim2.new(0,10,1,-75)
    ItemResultName.BackgroundTransparency=1; ItemResultName.TextColor3=Color3.fromRGB(255,255,255)
    ItemResultName.TextStrokeTransparency=0; ItemResultName.TextStrokeColor3=Color3.fromRGB(0,0,0)
    ItemResultName.TextScaled=true; ItemResultName.Font=Enum.Font.GothamBold
    ItemResultName.TextXAlignment=Enum.TextXAlignment.Left
    ItemResultName.Text=""; ItemResultName.ZIndex=101; ItemResultName.Parent=panel

    local ItemEmoji=Instance.new("TextLabel")
    ItemEmoji.Size=UDim2.new(0,250,0,250); ItemEmoji.Position=UDim2.new(0.5,-125,0.3,-125)
    ItemEmoji.BackgroundTransparency=1; ItemEmoji.TextColor3=Color3.fromRGB(255,255,255)
    ItemEmoji.TextScaled=true; ItemEmoji.Font=Enum.Font.GothamBlack
    ItemEmoji.Text="⚪"; ItemEmoji.ZIndex=101; ItemEmoji.Parent=panel

    return { ResultPanel=panel, OneInLabel=OneInLabel, ItemResultName=ItemResultName, ItemEmoji=ItemEmoji }
end