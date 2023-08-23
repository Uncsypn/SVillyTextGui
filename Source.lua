local SvillyHUD = {}

local function ToFormat(color3)
    return "rgb("..math.floor(math.min(color3.R*255,255))..", "..math.floor(math.min(color3.G*255,255))..", "..math.floor(math.min(color3.B*255,255))..")"
end

function SvillyHUD.new()
    local self = {}
    
    self.Instance = Instance.new("ScreenGui")
    self.Holder = Instance.new("Frame")
    self.Label = Instance.new("TextLabel")
    self.List = Instance.new("Frame")
    self.UIListLayout = Instance.new("UIListLayout")
    self.UIPadding = Instance.new("UIPadding")
    
    self.Items = {}
    
    self.Instance.Name = "SvillyHUD"
    self.Instance.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    self.Instance.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    self.Holder.Name = "Holder"
    self.Holder.Parent = self.Instance
    self.Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Holder.BackgroundTransparency = 1.000
    self.Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Holder.BorderSizePixel = 0
    self.Holder.Size = UDim2.new(0.128325567, 0, 1, 0)
    
    self.Label.Name = "Label"
    self.Label.Parent = self.Holder
    self.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Label.BackgroundTransparency = 1.000
    self.Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Label.BorderSizePixel = 0
    self.Label.Size = UDim2.new(1, 0, 0.0326465215, 0)
    self.Label.Font = Enum.Font.GothamBold
    self.Label.RichText = true
    self.Label.Text = ""
    self.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.Label.TextScaled = true
    self.Label.TextSize = 14.000
    self.Label.TextWrapped = true
    self.Label.TextXAlignment = Enum.TextXAlignment.Left
    self.Label.TextYAlignment = Enum.TextYAlignment.Top
    
    self.List.Name = "List"
    self.List.Parent = self.Holder
    self.List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.List.BackgroundTransparency = 1.000
    self.List.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.List.BorderSizePixel = 0
    self.List.Position = UDim2.new(0, 0, 0.0411522686, 0)
    self.List.Size = UDim2.new(1, 0, 1, 0)
    
    self.UIListLayout.Parent = self.List
    self.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    self.UIListLayout.Padding = UDim.new(0,5)
    
    self.UIPadding.Parent = self.Instance
    self.UIPadding.PaddingLeft = UDim.new(0, 15)
    self.UIPadding.PaddingTop = UDim.new(0, 15)
    
    function self:UpdateHud(Options)
        if Options.Text then
            self.Label.Text = Options.Text
        end
        if Options.Color then
            self.Label.TextColor3 = Options.Color
        end
        if Options.Visible ~= nil then
            if Options.Visible == false then
                game:GetService("TweenService"):Create(self.UIPadding,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{PaddingTop = UDim.new(0,0)}):Play()
                game:GetService("TweenService"):Create(self.Label,TweenInfo.new(0.8,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
            elseif Options.Visible == true then
                game:GetService("TweenService"):Create(self.UIPadding,TweenInfo.new(0.8,Enum.EasingStyle.Elastic,Enum.EasingDirection.Out),{PaddingTop = UDim.new(0,15)}):Play()
                game:GetService("TweenService"):Create(self.Label,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            end
        end
        if Options.Enabled ~= nil then
            self.Instance.Enabled = Options.Enabled
        end
    end
    
    function self:DestroyHud(bool)
        if bool == true and self.Instance then
            self.Instance:Destroy()
        end
    end
    
    function self:AddItem(FrameName, Options)
        local Color = Options.Color or Color3.fromRGB(255, 255, 255)
        local LabelText = Options.Text or ""
        local LabelFont = Options.Font or Enum.Font.SourceSansBold
    
        if not self.Items[FrameName] then
            local Item = Instance.new("Frame")
            local Line = Instance.new("Frame")
            local Label = Instance.new("TextLabel")
    
            Item.Name = FrameName
            Item.Parent = self.List
            Item.BackgroundTransparency = 1
            Item.Size = UDim2.new(1, 0, 0.0290000005, 0)
    
            Line.Name = "Line"
            Line.Parent = Item
            Line.Size = UDim2.new(0.0089999997, 0, 1, 0)
            Line.BorderSizePixel = 0
            Line.BackgroundColor3 = Color
            Line.BackgroundTransparency = 0
    
            Label.Name = "Label"
            Label.Parent = Item
            Label.RichText = true
            Label.BackgroundTransparency = 1.000
            Label.BorderSizePixel = 0
            Label.Position = UDim2.new(0.0502429344, 0, 0.16944845, 0)
            Label.Size = UDim2.new(0.94975704, 0, 0.632861614, 0)
            Label.Font = LabelFont
            Label.TextColor3 = Color
            Label.TextScaled = true
            Label.TextSize = 18.000
            Label.TextWrapped = true
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextTransparency = 0
    
            Label.Text = LabelText
    
            self.Items[FrameName] = Item
        else
            warn(FrameName.." Already Exists.")
        end
    end
    
    function self:UpdateItem(Name, Options)
        local Item = self.Items[Name]
        if Item then
            local Label = Item:FindFirstChild("Label")
            local Line = Item:FindFirstChild("Line")
    
            if Label then
                Label.TextColor3 = Options.Color or Label.TextColor3
                Label.Text = Options.Text or Label.Text
                Label.Font = Options.Font or Label.Font
            end
    
            if Line then
                Line.BackgroundColor3 = Options.Color or Line.BackgroundColor3
            end
        end
    end
    
    function self:RemoveItem(Name)
        local Item = self.Items[Name]
        if Item then
            Item:Destroy()
            self.Items[Name] = nil
        end
    end
    
    return self
end

return SvillyHUD
