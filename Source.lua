local UI = {}

local HudText = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local LogoText = Instance.new("TextLabel")
local Window = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
HudText.Name = "HudText"
HudText.Parent = game:GetService("CoreGui")
HudText.ZIndexBehavior = Enum.ZIndexBehavior.Global
HudText.ResetOnSpawn = false
Holder.Name = "Holder"
Holder.Parent = HudText
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Holder.BorderSizePixel = 0
Holder.Size = UDim2.new(0.116890661, 0, 1, 0)
LogoText.Name = "LogoText"
LogoText.Parent = Holder
LogoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LogoText.BackgroundTransparency = 1.000
LogoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
LogoText.BorderSizePixel = 0
LogoText.Size = UDim2.new(1, 0, 0.0332810916, 0)
LogoText.Font = Enum.Font.GothamBold
LogoText.TextColor3 = Color3.fromRGB(0, 0, 0)
LogoText.TextScaled = true
LogoText.TextSize = 14.000
LogoText.TextWrapped = true
LogoText.TextXAlignment = Enum.TextXAlignment.Left
LogoText.TextYAlignment = Enum.TextYAlignment.Top
Window.Name = "Window"
Window.Parent = Holder
Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Window.BackgroundTransparency = 1.000
Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
Window.BorderSizePixel = 0
Window.Size = UDim2.new(1, 0, 1, 0)
UIListLayout.Parent = Window
UIListLayout.Padding = UDim.new(0, 3)
UIListLayout.SortOrder = Enum.SortOrder.Name
UIListLayout_2.Parent = Holder
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 3)
UIPadding.Parent = HudText
UIPadding.PaddingLeft = UDim.new(0, 15)
UIPadding.PaddingTop = UDim.new(0, 15)

local TableOfName = {}
local TableOfItem = {}

function UI:DualStringHandler(color3)
	if color3 then
		return "rgb("..math.floor(math.min(color3.R*255,255))..", "..math.floor(math.min(color3.G*255,255))..", "..math.floor(math.min(color3.B*255,255))..")"
	end
end

function UI:DualStrings(Color, Table)
	return string.format("%s <font color='%s'>%s</font>", Table.LLabel or "", UI:DualStringHandler(Color), Table.RLabel or "")
end

function UI:DestroyHud()
	if HudText and HudText.Parent then
		HudText:Destroy() 
	end
end

function UI:UpdateHud(Table)
	if Table and Window and Window.Parent and LogoText and LogoText.Parent then
		if Table.Color then
			LogoText.TextColor3 = Table.Color
		end
		if Table.RichText then
			LogoText.RichText = Table.RichText
		end
		if Table.Text then
			LogoText.Text = Table.Text
		end
		if Table.Shadow then
			if Table.Shadow == true then
				LogoText.TextStrokeTransparency = 0.85
			else
				LogoText.TextStrokeTransparency = 1
			end
		end
		if Table.Font then
			LogoText.Font = Table.Font
		end
		if Table.Logo then
			LogoText.Visible = Table.Logo
		end
		if Table.Enabled then
			if HudText then
				HudText.Enabled = Table.Enabled
			end
		end
	end
end

local function ZIndexAdjuster(String)
	local number = tonumber(String)
	if number then
		return string.rep("_", number)
	else
		return ""
	end
end

function UI:AddItem(Name, Table)
	if Window and Window.Parent and Name and TableOfName[Name] == nil then
		TableOfName[Name] = true
		local ItemInstance = Instance.new("Frame")
		local LineInstance = Instance.new("Frame")
		local LabelInstance = Instance.new("TextLabel")
		ItemInstance.Parent = Window
		ItemInstance.Name = Table.ZIndex and tonumber(Table.ZIndex) and ZIndexAdjuster(Table.ZIndex) or Name
		ItemInstance.BackgroundColor3 = Table.Color or Color3.fromRGB(255, 255, 255)
		ItemInstance.BackgroundTransparency = Table.Background and 0.9 or 1
		ItemInstance.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ItemInstance.BorderSizePixel = 0
		ItemInstance.Size = UDim2.new(0, 0, 0.026, 0)
		LineInstance.Parent = ItemInstance
		LineInstance.BackgroundColor3 = Table.Color or Color3.fromRGB(255, 255, 255)
		LineInstance.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LineInstance.BorderSizePixel = 0
		LineInstance.Size = UDim2.new(0, 3, 1, 0)
		LineInstance.Name = "Line"
		LabelInstance.Parent = ItemInstance
		LabelInstance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		LabelInstance.BackgroundTransparency = 1.000
		LabelInstance.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LabelInstance.BorderSizePixel = 0
		LabelInstance.Position = UDim2.new(0, 8, 0, 2)
		LabelInstance.Size = UDim2.new(1, -16, 1, -4)
		LabelInstance.RichText = Table.RichText or false
		LabelInstance.Font = Table.Font or Enum.Font.SourceSans
		LabelInstance.Text = Table.Text or "Label"
		LabelInstance.TextColor3 = Table.Color or Color3.fromRGB(255, 255, 255)
		LabelInstance.TextSize = 14.000
		LabelInstance.TextXAlignment = Enum.TextXAlignment.Left
		LabelInstance.TextStrokeTransparency = Table.Shadow and 0.85 or 1
		LabelInstance.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		LabelInstance.Name = "Label"
		ItemInstance.Size = UDim2.new(0, LabelInstance.TextBounds.X + 15, 0.026, 0)
		TableOfItem[Name] = ItemInstance
	end
end

function UI:UpdateItem(Name, Table)
	local itemInstance = TableOfItem[Name]
	if itemInstance and itemInstance.Parent and Name and TableOfName[Name] then
		if Table.Color then
			itemInstance.BackgroundColor3 = Table.Color
			if itemInstance.Label then
				itemInstance.Label.TextColor3 = Table.Color
			end
			if itemInstance.Line then
				itemInstance.Line.BackgroundColor3 = Table.Color
			end
		end
		if Table.Font then
			if itemInstance.Label then
				itemInstance.Label.Font = Table.Font
			end
		end
		if Table.Text then
			if itemInstance.Label then
				itemInstance.Label.Text = Table.Text
			end
		end
		if Table.ZIndex then
			itemInstance.Name = itemInstance.Name..(Table.ZIndex and tonumber(Table.ZIndex) and ZIndexAdjuster(Table.ZIndex))
		end
		if Table.RichText then
			if itemInstance.Label then
				itemInstance.Label.RichText = Table.RichText
			end
		end
		if Table.Shadow then
			if Table.Shadow == true then
				itemInstance.Label.TextStrokeTransparency = 0.85
			else
				itemInstance.Label.TextStrokeTransparency = 1
			end
		end
		if Table.Background ~= nil then
			itemInstance.BackgroundTransparency = Table.Background and 0.9 or 1
		end

		pcall(function()
			itemInstance.Size = UDim2.new(0, itemInstance.Label.TextBounds.X + 18, 0.026, 0)
		end)
	end
end

function UI:RemoveItem(Name)
	local itemInstance = TableOfItem[Name]
	if itemInstance and itemInstance.Parent and Name and TableOfName[Name] then
		itemInstance:Destroy()
		TableOfItem[Name] = nil
		TableOfName[Name] = nil
	end
end

return UI
