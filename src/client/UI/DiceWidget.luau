-- UI/DiceWidget.luau
return function(ScreenGui)
    local DiceEmoji=Instance.new("TextLabel")
    DiceEmoji.Size=UDim2.new(0,80,0,80); DiceEmoji.Position=UDim2.new(0.5,-40,1,-210)
    DiceEmoji.BackgroundTransparency=1; DiceEmoji.TextColor3=Color3.fromRGB(255,255,255)
    DiceEmoji.TextStrokeTransparency=0.4; DiceEmoji.TextStrokeColor3=Color3.new(0,0,0)
    DiceEmoji.TextScaled=true; DiceEmoji.Font=Enum.Font.GothamBlack
    DiceEmoji.Text="🎲"; DiceEmoji.Parent=ScreenGui

    local StatusLabel=Instance.new("TextLabel")
    StatusLabel.Size=UDim2.new(0,400,0,28); StatusLabel.Position=UDim2.new(0.5,-200,1,-150)
    StatusLabel.BackgroundTransparency=1; StatusLabel.TextColor3=Color3.fromRGB(230,210,255)
    StatusLabel.TextStrokeTransparency=0.6; StatusLabel.TextStrokeColor3=Color3.new(0,0,0)
    StatusLabel.TextScaled=true; StatusLabel.Font=Enum.Font.Gotham
    StatusLabel.Text=""; StatusLabel.Parent=ScreenGui

    return { DiceEmoji=DiceEmoji, StatusLabel=StatusLabel }
end