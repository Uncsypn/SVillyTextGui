-- Define Library.
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Uncsypn/SVillyTextGui/main/Source.lua"))()

-- Update Window.
UI:Refresh({
	Enabled = true,
	Visible = true,
	Shadow = true,
	Color = Color3.fromRGB(255, 255, 255),
	Font = Enum.Font.SourceSansBold,
	Text = UI:DualStrings(Color3.fromRGB(255, 0, 0), {LLabel = "Text", RLabel = "Gui"}),
})

-- Add Item.
UI:Add("Item",{
	Background = true,
	Shadow = true,
	Smooth = false,
	Font = Enum.Font.SourceSans,
	Color = Color3.fromRGB(255, 255, 255),
	Order = "Manual",
	Text = UI:DualStrings(Color3.fromRGB(255, 0, 0), {LLabel = "String1", RLabel = "String2"}),
})

-- Update Item.
UI:Update("Item",{
	Background = true,
	Shadow = false,
	Smooth = true,
	Font = Enum.Font.SourceSansSemibold,
	Color = Color3.fromRGB(255, 0, 0),
	Order = 1,
	Text = "String3",
})

-- Remove Item.
UI:Remove("Item", {Smooth = true})

-- Update LayoutOrder.
UI:UpdateLayoutOrder()

-- Loop LayoutOrder.
UI:RefreshLayoutOrder(true)

-- Deletes UI.
UI:Clear()
