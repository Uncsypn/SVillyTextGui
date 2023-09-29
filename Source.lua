local Library = {}

function randomString()
	local randomlength = math.random(10,100)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

local Settings = {
	Enabled = false,
	Visible = false,
	PadLine = false,
	Shadow = false,
	Padding = 0,
	Text = "",
	Font = Enum.Font.Unknown,
	Color = {
		R = 255,
		G = 255,
		B = 255,
	},
	OrgWatermarkSize = nil,
}

local TextGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Padding = Instance.new("UIListLayout")
local Label = Instance.new("TextLabel")
local List = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local UICorner_2 = Instance.new("UICorner")
local NO_NOT_CHANGE = Instance.new("UIListLayout")
local NO_NOT_CHANGE_2 = Instance.new("UIPadding")
TextGui.Name = randomString()
TextGui.Parent = game:GetService("CoreGui")
TextGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
TextGui.ResetOnSpawn = false
TextGui.Enabled = Settings.Enabled
TextGui.OnTopOfCoreBlur = true
TextGui.DisplayOrder = 999
Main.Name = randomString()
Main.Parent = TextGui
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0.149837136, 0, 1, 0)
Padding.Name = randomString()
Padding.Parent = Main
Padding.SortOrder = Enum.SortOrder.LayoutOrder
Padding.Padding = UDim.new(0, 9)
Label.Name = randomString()
Label.Visible = Settings.Visible
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(1, 0, 0.0372611545, 0)
Settings.OrgWatermarkSize = Label.Size
Label.Font = Settings.Font
Label.Text = Settings.Text
Label.TextColor3 = Color3.fromRGB(Settings.Color.R, Settings.Color.G, Settings.Color.B)
Label.TextScaled = true
Label.TextSize = 100.000
Label.TextWrapped = true
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.TextStrokeTransparency = Settings.Shadow == true and 0.7 or 1
Label.RichText = true
List.Name = randomString()
List.Parent = Main
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.BorderColor3 = Color3.fromRGB(0, 0, 0)
List.BorderSizePixel = 0
List.LayoutOrder = 2
List.Position = UDim2.new(0, 0, 0.0500000082, 0)
List.Size = UDim2.new(1, 0, 1, 0)
UIListLayout.Parent = List
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, Settings.Padding)
UIListLayout.Name = randomString()
Frame.Parent = Main
Frame.Visible = Settings.PadLine
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.LayoutOrder = 1
Frame.Size = UDim2.new(1, 0, 0, 5)
Frame.Name = randomString()
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 10, 0, 10)
Frame_2.Name = randomString()
UICorner.CornerRadius = UDim.new(1, 1)
UICorner.Parent = Frame_2
UICorner.Name = randomString()
UIListLayout_2.Parent = Frame
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_2.Name = randomString()
UIListLayout_2.SortOrder = Enum.SortOrder.Name
UICorner_2.CornerRadius = UDim.new(1, 1)
UICorner_2.Parent = Frame
UICorner_2.Name = randomString()
NO_NOT_CHANGE.Name = "NO_NOT_CHANGE-"..randomString()
NO_NOT_CHANGE.Parent = TextGui
NO_NOT_CHANGE.SortOrder = Enum.SortOrder.LayoutOrder
NO_NOT_CHANGE_2.Name = "NO_NOT_CHANGE-"..randomString()
NO_NOT_CHANGE_2.Parent = TextGui
NO_NOT_CHANGE_2.PaddingBottom = UDim.new(0, 15)
NO_NOT_CHANGE_2.PaddingLeft = UDim.new(0, 15)
NO_NOT_CHANGE_2.PaddingRight = UDim.new(0, 15)
NO_NOT_CHANGE_2.PaddingTop = UDim.new(0, 15)

local ItemsList = {}

function UpdateLayoutOrder()
	local textLengths = {}
	for _, v in pairs(ItemsList) do
		if v ~= nil and v:FindFirstChildWhichIsA("TextLabel") then
			local textLabel = v:FindFirstChildWhichIsA("TextLabel")
			local text = textLabel.Text
			local length = string.len(text)
			table.insert(textLengths, {Item = v, Length = length})
		end
	end

	table.sort(textLengths, function(a, b)
		return a.Length > b.Length
	end)
	
	for i, info in ipairs(textLengths) do
		if info.Item ~= nil and info.Item:IsA("Frame") then
			info.Item.LayoutOrder = i - 1
		end
	end
end

function DualStringHandler(color3)
	if color3 then
		return "rgb("..math.floor(math.min(color3.R*255,255))..", "..math.floor(math.min(color3.G*255,255))..", "..math.floor(math.min(color3.B*255,255))..")"
	end
end

function Library:DualStrings(Color, Table)
	if Table.RLabel then
		return string.format("%s <font color='%s'>%s</font>", Table.LLabel or "", DualStringHandler(Color), Table.RLabel or "")
	else
		return Table.LLabel
	end
end

function Library:Refresh(Table)
	if Table.Enabled ~= nil and type(Table.Enabled) == "boolean" then TextGui.Enabled = Table.Enabled end
	if Table.Watermark ~= nil and type(Table.Watermark) == "boolean" then Label.Visible = Table.Watermark end
	if Table.Shadow ~= nil and type(Table.Shadow) == "boolean" then Label.TextStrokeTransparency = Table.Shadow == true and 0.7 or 1 end
	if Table.Text ~= nil and type(Table.Text) == "string" then Label.Text = Table.Text end
	if Table.Font ~= nil then Label.Font = Table.Font end
	if Table.Color ~= nil then Label.TextColor3 = Table.Color end
	if Table.PadLine ~= nil and  type(Table.PadLine) == "boolean" then Frame.Visible = Table.PadLine end
end

function Library:Add(Name, Table)
	if List and List.Parent and Name ~= ("" or nil) and type(Name) == "string" and ItemsList[Name] == nil then
		local Item = Instance.new("Frame")
		ItemsList[Name] = Item
		local Line = Instance.new("Frame")
		local Keep = Instance.new("UIListLayout")
		local TextLabel = Instance.new("TextLabel")
		local Keep_2 = Instance.new("UIStroke")
		Item.Name = randomString()
		Item.Parent = List
		Item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Item.BackgroundTransparency = Table.Background ~= nil and type(Table.Background) == "boolean" and Table.Background == true and 0.9 or Table.Background ~= nil and type(Table.Background) == "boolean" and Table.Background == false and 1 or 1
		Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Item.BorderSizePixel = 0
		Item.Size = UDim2.new(0, 0, 0.029, 0)
		Item.ClipsDescendants = true
		Line.Name = randomString()
		Line.Parent = Item
		Line.BackgroundColor3 = Color3.fromRGB(255, 200, 255)
		Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Line.BorderSizePixel = 0
		Line.Size = UDim2.new(0, 3, 1, 0)
		Keep.Name = randomString()
		Keep.Parent = Item
		Keep.FillDirection = Enum.FillDirection.Horizontal
		Keep.SortOrder = Enum.SortOrder.LayoutOrder
		Keep.VerticalAlignment = Enum.VerticalAlignment.Center
		Keep.Padding = UDim.new(0, 6)
		TextLabel.Parent = Item
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(1, 0, 0.800000012, 0)
		TextLabel.Font = Table.Font ~= nil and Table.Font or Enum.Font.Unknown
		TextLabel.RichText = true
		TextLabel.Text = Table.Text ~= nil and type(Table.Text) == "string" and Table.Text or ""
		TextLabel.TextColor3 = Table.Color ~= nil and Table.Color or Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = Table.Shadow ~= nil and type(Table.Shadow) == "boolean" and Table.Shadow == true and 0.8 or Table.Shadow ~= nil and type(Table.Shadow) == "boolean" and Table.Shadow == false and 1 or 1
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.Name = randomString()
		Keep_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		Keep_2.Thickness = 1.300
		Keep_2.Transparency = Table.StrokeShadow ~= nil and type(Table.StrokeShadow) == "boolean" and Table.StrokeShadow == true and 0.8 or Table.StrokeShadow ~= nil and type(Table.StrokeShadow) == "boolean" and Table.StrokeShadow == false and 1 or 1
		Keep_2.Parent = Item
		Keep_2.Name = randomString()
		if Table.Smooth ~= nil and type(Table.Smooth) == "boolean" and Table.Smooth == true then
			game:GetService("TweenService"):Create(Item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, TextLabel.TextBounds.X + 17, 0.029, 0)}):Play()
		else
			Item.Size = UDim2.new(0, TextLabel.TextBounds.X + 17, 0.029, 0)
		end
	end
end

function Library:Update(Name, Table)
	if List and List.Parent and Name ~= ("" or nil) and type(Name) == "string" and ItemsList[Name] ~= nil then
		local Item = ItemsList[Name]
		local Line = ItemsList[Name]:FindFirstChildWhichIsA("Frame")
		local TextLabel = ItemsList[Name]:FindFirstChildWhichIsA("TextLabel")
		local Keep_2 = ItemsList[Name]:FindFirstChildWhichIsA("UIStroke")
		Item.BackgroundTransparency = Table.Background ~= nil and type(Table.Background) == "boolean" and Table.Background == true and 0.9 or Table.Background ~= nil and type(Table.Background) == "boolean" and Table.Background == false and 1 or Item.BackgroundTransparency
		TextLabel.Font = Table.Font ~= nil and Table.Font or TextLabel.Font
		TextLabel.Text = Table.Text ~= nil and type(Table.Text) == "string" and Table.Text or TextLabel.Text
		TextLabel.TextColor3 = Table.Color ~= nil and Table.Color or TextLabel.TextColor3
		TextLabel.TextStrokeTransparency = Table.Shadow ~= nil and type(Table.Shadow) == "boolean" and Table.Shadow == true and 0.8 or Table.Shadow ~= nil and type(Table.Shadow) == "boolean" and Table.Shadow == false and 1 or TextLabel.TextStrokeTransparency
		Keep_2.Transparency = Table.StrokeShadow ~= nil and type(Table.StrokeShadow) == "boolean" and Table.StrokeShadow == true and 0.8 or Table.StrokeShadow ~= nil and type(Table.StrokeShadow) == "boolean" and Table.StrokeShadow == false and 1 or Keep_2.Transparency
		if Table.Smooth ~= nil and type(Table.Smooth) == "boolean" and Table.Smooth == true then
			game:GetService("TweenService"):Create(Item, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, TextLabel.TextBounds.X + 17, 0.029, 0)}):Play()
		else
			Item.Size = UDim2.new(0, TextLabel.TextBounds.X + 17, 0.029, 0)
		end
	end
end

function Library:Remove(Name, Table)
	if Name ~= ("" or nil) and type(Name) == "string" and ItemsList[Name] ~= nil then
		local Target = ItemsList[Name]
		if Table.Smooth ~= nil and type(Table.Smooth) == "boolean" and Table.Smooth == true then
			local Goal = game:GetService("TweenService"):Create(Target, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0.029, 0)})
			Goal:Play()
			Goal.Completed:Connect(function()
				Target:Destroy()
				ItemsList[Name] = nil
			end)
		else
			Target:Destroy()
			ItemsList[Name] = nil
		end
	end
end

function Library:RemoveAll(Table)
	if Table.Smooth ~= nil and type(Table.Smooth) == "boolean" and Table.Smooth == true then
		for _,v in pairs(ItemsList) do
			if v ~= nil and v:IsA("Frame") then
				local Goal = game:GetService("TweenService"):Create(v, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0.029, 0)})
				Goal:Play()
				Goal.Completed:Connect(function()
					v:Destroy()
					v = nil
				end)
			end
		end
	else
		for _,v in pairs(ItemsList) do
			if v ~= nil and v:IsA("Frame") then
				v:Destroy()
				v = nil
			end
		end
	end
end

local Connection = nil
function Library:AutoUpdateLayout(Bool)
	if Bool ~= nil and type(Bool) == "boolean" then
		if Bool == true then
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			Connection = game:GetService("RunService").PreRender:Connect(UpdateLayoutOrder)
		elseif Bool == false then
			if Connection ~= nil then Connection:Disconnect() Connection = nil end
			UIListLayout_2.SortOrder = Enum.SortOrder.Name
		end
	end
end

function Library:Clear()
	if TextGui ~= nil then
		TextGui:Destroy()
		if Connection ~= nil then Connection:Disconnect() end
		table.clear(ItemsList)
	end
end

return Library
