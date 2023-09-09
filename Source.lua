local UI = {}

function UI:randomString()
	local randomlength = math.random(10,100)
	local array = {}

	for i = 1, randomlength do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

UI.Screen = Instance.new("ScreenGui")
UI.wtf = Instance.new("UIListLayout")
UI.Main = Instance.new("Frame")
UI.Label = Instance.new("TextLabel")
UI.bro_stop = Instance.new("UIListLayout")
UI.Frame = Instance.new("Frame")
UI.this_shit_is_not_funny = Instance.new("UIListLayout")
UI.how = Instance.new("UIPadding")
UI.Screen.Name = UI:randomString()
UI.Screen.Parent = game:GetService("CoreGui")
UI.Screen.ZIndexBehavior = Enum.ZIndexBehavior.Global
UI.Screen.ResetOnSpawn = false
UI.Screen.OnTopOfCoreBlur = true
UI.Screen.DisplayOrder = 999
UI.wtf.Name = "wtf"
UI.wtf.Parent = UI.Screen
UI.wtf.SortOrder = Enum.SortOrder.LayoutOrder
UI.wtf.VerticalAlignment = Enum.VerticalAlignment.Center
UI.Main.Name = "Main"
UI.Main.Parent = UI.Screen
UI.Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.Main.BackgroundTransparency = 1.000
UI.Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.Main.BorderSizePixel = 0
UI.Main.Size = UDim2.new(0.188335866, 0, 1, 0)
UI.Label.Name = "Label"
UI.Label.Parent = UI.Main
UI.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.Label.BackgroundTransparency = 1.000
UI.Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.Label.BorderSizePixel = 0
UI.Label.Size = UDim2.new(1, 0, 0.0498938411, 0)
UI.Label.Font = Enum.Font.Unknown
UI.Label.Text = ""
UI.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
UI.Label.TextScaled = true
UI.Label.TextSize = 14.000
UI.Label.TextStrokeTransparency = 0.850
UI.Label.TextWrapped = true
UI.Label.TextXAlignment = Enum.TextXAlignment.Left
UI.Label.RichText = true
UI.bro_stop.Name = "bro_stop"
UI.bro_stop.Parent = UI.Main
UI.bro_stop.SortOrder = Enum.SortOrder.LayoutOrder
UI.Frame.Parent = UI.Main
UI.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.Frame.BackgroundTransparency = 1.000
UI.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.Frame.BorderSizePixel = 0
UI.Frame.LayoutOrder = 1
UI.Frame.Name = "LayoutMod"
UI.Frame.Size = UDim2.new(1, 0, 1, 0)
UI.this_shit_is_not_funny.Name = "this_shit_is_not_funny"
UI.this_shit_is_not_funny.Parent = UI.Frame
UI.this_shit_is_not_funny.SortOrder = Enum.SortOrder.LayoutOrder
UI.how.Name = "how"
UI.how.Parent = UI.Screen
UI.how.PaddingBottom = UDim.new(0, 15)
UI.how.PaddingLeft = UDim.new(0, 15)
UI.how.PaddingTop = UDim.new(0, 15)

UI.TableOfItems = {}
UI.Settings = {Size = {isize=13,Padding=5,vsize=0.0218471342}}

function DualStringHandler(color3)
	if color3 then
		return "rgb("..math.floor(math.min(color3.R*255,255))..", "..math.floor(math.min(color3.G*255,255))..", "..math.floor(math.min(color3.B*255,255))..")"
	end
end

function UI:DualStrings(Color, Table)
	if Table.RLabel then
		return string.format("%s <font color='%s'>%s</font>", Table.LLabel or "", DualStringHandler(Color), Table.RLabel or "")
	else
		return Table.LLabel
	end
end

local function compareByLength(a, b)
	return string.len(a) > string.len(b)
end

function UI:UpdateLayoutOrder()
	local layouts = {}
	for _, elements in pairs(UI.TableOfItems) do
		local label = elements.Label
		layouts[label.Text] = label
	end
	local sortedLabels = {}
	for _, label in pairs(layouts) do
		table.insert(sortedLabels, label)
	end
	table.sort(sortedLabels, function(a, b)
		return string.len(a.Text) > string.len(b.Text)
	end)
	for index, label in ipairs(sortedLabels) do
		local itemFrame = label.Parent
		itemFrame.LayoutOrder = index - 1
	end
end

UI.Loop = nil

function UI:RefreshLayoutOrder(Bool)
	if Bool == true then
		UI.Loop = game:GetService("RunService").Heartbeat:Connect(function()
			UI:UpdateLayoutOrder()
		end)
	elseif Bool == false then
		if UI.Loop ~= nil then
			UI.Loop:Disconnect()
			UI.Loop = nil
		end
	end
end

function UI:Refresh(Table)
	if UI.Label then
		if Table.Text then
			UI.Label.Text = Table.Text
		end
		if Table.Shadow ~= nil then
			if Table.Shadow == true then
				UI.Label.TextStrokeTransparency = 0.85
			else
				UI.Label.TextStrokeTransparency = 1
			end
		end
		if Table.Color then
			UI.Label.TextColor3 = Table.Color
		end
		if Table.Visible ~= nil then
			UI.Label.Visible = Table.Visible
		end
		if Table.Enabled ~= nil then
			UI.Screen.Enabled = Table.Enabled
		end
		if Table.Font then
			UI.Label.Font = Table.Font
		end
	end
end

function UI:Add(Name, Table)
	if Name and Name ~= ("" or nil) and UI.Frame and UI.Frame.Parent and not UI.TableOfItems[Name] then
		UI.TableOfItems[Name] = Instance.new("Frame")
		local ItemLine = Instance.new("Frame")
		local Label = Instance.new("TextLabel")
		local LayoutModifier = Instance.new("UIListLayout")
		UI.TableOfItems[Name].Name = Name
		UI.TableOfItems[Name].Parent = UI.Frame
		UI.TableOfItems[Name].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		if Table.Background ~= nil then
			if Table.Background == true then
				UI.TableOfItems[Name].BackgroundTransparency = 0.650
			else
				UI.TableOfItems[Name].BackgroundTransparency = 1
			end
		end
		UI.TableOfItems[Name].BorderColor3 = Color3.fromRGB(0, 0, 0)
		UI.TableOfItems[Name].BorderSizePixel = 0
		UI.TableOfItems[Name].Position = UDim2.new(0, 0, -0.00106157118, 0)
		UI.TableOfItems[Name].Size = UDim2.new(0, 0, 0, 0)
		UI.TableOfItems[Name].ClipsDescendants = true
		ItemLine.Parent = UI.TableOfItems[Name]
		ItemLine.BackgroundColor3 = Table.Color or Color3.fromRGB(255, 255, 255)
		ItemLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ItemLine.BorderSizePixel = 0
		ItemLine.Size = UDim2.new(0, 2, 1, 0)
		ItemLine.Name = "Line"
		ItemLine.LayoutOrder = 0
		Label.Parent = UI.TableOfItems[Name]
		Label.Text = Table.Text or ""
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0.103448279, 0, 0, 0)
		Label.Size = UDim2.new(1, 0, 1, 0)
		Label.Font = Table.Font or Enum.Font.Unknown
		Label.TextColor3 = Table.Color or Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000
		Label.Name = "Label"
		Label.RichText = true
		Label.LayoutOrder = 1
		if Table.Shadow ~= nil then
			if Table.Shadow == true then
				Label.TextStrokeTransparency = 0.850
			else
				Label.TextStrokeTransparency = 1
			end
		end
		Label.TextXAlignment = Enum.TextXAlignment.Left
		LayoutModifier.Parent = UI.TableOfItems[Name]
		LayoutModifier.FillDirection = Enum.FillDirection.Horizontal
		LayoutModifier.SortOrder = Enum.SortOrder.LayoutOrder
		LayoutModifier.Padding = UDim.new(0, UI.Settings.Size.Padding)

		if Table.Order then
			if tonumber(Table.Order) then
				UI.TableOfItems[Name].LayoutOrder = Table.Order
			elseif Table.Order == "Manual" then
				UI:UpdateLayoutOrder()
			end
		end

		if Table.Smooth ~= nil then
			if Table.Smooth == true then
				UI.TableOfItems[Name].Size = UDim2.new(0, 0, UI.Settings.Size.vsize, 0)
				game:GetService("TweenService"):Create(UI.TableOfItems[Name], TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, Label.TextBounds.X + UI.Settings.Size.isize, UI.Settings.Size.vsize, 0)}):Play()
			else
				UI.TableOfItems[Name].Size = UDim2.new(0, Label.TextBounds.X + UI.Settings.Size.isize, UI.Settings.Size.vsize, 0)
			end
		end
	end
end

function UI:Update(Name, Table)
	if Name and UI.Frame and UI.Frame.Parent and UI.TableOfItems[Name] then
		if Table.Background ~= nil then
			if Table.Background == true then
				UI.TableOfItems[Name].BackgroundTransparency = 0.650
			else
				UI.TableOfItems[Name].BackgroundTransparency = 1
			end
		end
		if Table.Color then
			local label = UI.TableOfItems[Name]:FindFirstChild("Label")
			local line = UI.TableOfItems[Name]:FindFirstChild("Line")
			if label then
				label.TextColor3 = Table.Color
			end
			if line then
				line.BackgroundColor3 = Table.Color
			end
		end
		if Table.Font then
			local label = UI.TableOfItems[Name]:FindFirstChild("Label")
			if label then
				label.Font = Table.Font
			end
		end
		if Table.Shadow ~= nil then
			local label = UI.TableOfItems[Name]:FindFirstChild("Label")
			if label then
				if Table.Shadow == true then
					label.TextStrokeTransparency = 0.850
				else
					label.TextStrokeTransparency = 1
				end
			end
		end
		if Table.Text then
			local label = UI.TableOfItems[Name]:FindFirstChild("Label")
			if label then
				label.Text = Table.Text
			end
		end
		if Table.Order then
			if tonumber(Table.Order) then
				UI.TableOfItems[Name].LayoutOrder = Table.Order
			elseif Table.Order == "Manual" then
				UI:UpdateLayoutOrder()
			end
		end
		pcall(function()
			local label = UI.TableOfItems[Name]:FindFirstChild("Label")
			if label then
				if Table.Smooth ~= nil then
					if Table.Smooth == true then
						game:GetService("TweenService"):Create(UI.TableOfItems[Name], TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, UI.TableOfItems[Name]:FindFirstChild("Label").TextBounds.X + UI.Settings.Size.isize, UI.Settings.Size.vsize, 0)}):Play()
					else
						UI.TableOfItems[Name].Size = UDim2.new(0, UI.TableOfItems[Name]:FindFirstChild("Label").TextBounds.X + UI.Settings.Size.isize, UI.Settings.Size.vsize, 0)
					end
				end
			end
		end)
	else
		-- warn("Item Does Not Exist:", Name or nil)
	end
end

function UI:Remove(Name, Table)
	if Name and Name ~= "" and UI.Frame and UI.Frame.Parent and UI.TableOfItems[Name] then
		if Table.Smooth == true then
			local tween = game:GetService("TweenService"):Create(UI.TableOfItems[Name], TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, UI.Settings.Size.vsize, 0)})
			tween:Play()
			tween.Completed:Connect(function()
				if UI.TableOfItems[Name] then
					pcall(function()
						game:GetService("TweenService"):Create(UI.TableOfItems[Name], TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0, 0, 0)}):Play()
						wait(0.15)
						UI.TableOfItems[Name]:Destroy()
						UI.TableOfItems[Name] = nil
					end)
				end
			end)
		else
			UI.TableOfItems[Name]:Destroy()
			UI.TableOfItems[Name] = nil
		end
	end
end


function UI:Clear()
	pcall(function()
		UI:RefreshLayoutOrder(false)
		table.clear(UI.TableOfItems)
		UI.Screen:Destroy()
	end)
end

return UI
