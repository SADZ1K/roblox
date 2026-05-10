-- Roll/PlayAnimation.luau
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

return function(ui, result)
    local panel=ui.ResultPanel; local ItemEmoji=ui.ItemEmoji
    local OneInLabel=ui.OneInLabel; local ItemResultName=ui.ItemResultName

    if result.won and result.item then
        local item=result.item; local col=Color3.fromHex(item.colorHex)
        ItemEmoji.Text=item.emoji; ItemEmoji.TextColor3=col
        ItemResultName.Text=item.name; ItemResultName.TextColor3=col
        local raw=tostring(result.effectiveChance or ""):gsub("1/","")
        OneInLabel.Text="1 in "..(raw~="" and raw or "?")
    else
        ItemEmoji.Text="🎲"; ItemEmoji.TextColor3=Color3.fromRGB(200,200,200)
        ItemResultName.Text="Brak trafu..."; ItemResultName.TextColor3=Color3.fromRGB(200,200,200)
        OneInLabel.Text=""
    end

    ui.DiceEmoji.Visible=false; ui.StatusLabel.Visible=false
    panel.Visible=true; panel.BackgroundTransparency=0.3
    ItemEmoji.TextTransparency=1; ItemEmoji.Position=UDim2.new(0.5,-125,1.2,0)
    ItemEmoji.Rotation=-15; ItemEmoji.Size=UDim2.new(0,150,0,150)
    OneInLabel.TextTransparency=1; ItemResultName.TextTransparency=1

    TweenService:Create(ItemEmoji,
        TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
        {Position=UDim2.new(0.5,-125,0.3,-125),Rotation=0,Size=UDim2.new(0,250,0,250),TextTransparency=0}
    ):Play()
    task.wait(0.3)
    TweenService:Create(OneInLabel,TweenInfo.new(0.4),{TextTransparency=0}):Play()
    TweenService:Create(ItemResultName,TweenInfo.new(0.4),{TextTransparency=0}):Play()
    task.wait(0.5)
    local floatTween=TweenService:Create(ItemEmoji,
        TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),
        {Position=UDim2.new(0.5,-125,0.28,-125)})
    floatTween:Play()

    local dismissed=false
    local conn=UserInputService.InputBegan:Connect(function(_,gp) if not gp then dismissed=true end end)
    local t=0
    while t<2.5 and not dismissed do task.wait(0.1); t+=0.1 end
    conn:Disconnect(); floatTween:Cancel()

    local fi=TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
    TweenService:Create(panel,fi,{BackgroundTransparency=1}):Play()
    TweenService:Create(ItemEmoji,fi,{TextTransparency=1}):Play()
    TweenService:Create(OneInLabel,fi,{TextTransparency=1}):Play()
    TweenService:Create(ItemResultName,fi,{TextTransparency=1}):Play()
    task.wait(0.4)
    panel.Visible=false; ui.DiceEmoji.Visible=true; ui.StatusLabel.Visible=true
end