local widgetInfo  = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, --This can be changed--
	false,
	false,
	200,
	200,
	150,
	150)
local widget = plugin:CreateDockWidgetPluginGui("MistEdge Studio Plugin", widgetInfo)
widget.Title = "MistEdge Studio"
local toolbar = plugin:CreateToolbar("MistEdge Studio")
local toggle = toolbar:CreateButton("MistEdge Studio Plugin", "Start using MistEdge Resources", "")

toggle.Click:Connect(function()
	widget.Enabled = not widget.Enabled
	
end)

local testButton = Instance.new("TextButton")
testButton.BorderSizePixel = 0
testButton.TextScaled = true
testButton.TextColor3 = Color3.new(1,0.2,0.4)
testButton.AnchorPoint = Vector2.new(0,0)
testButton.Size = UDim2.new(.4,0,.4,0)
testButton.Position = UDim2.new(0.5,0,0.5,0)
testButton.SizeConstraint = Enum.SizeConstraint.RelativeYY
testButton.Text = "Click Me"
testButton.Parent = widget
frame = Instance.new("Frame")
install = Instance.new("TextButton")
install.Size = UDim2.fromScale(.4,.15)
install.BorderSizePixel = 1
install.Text = "Install Module"
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
install.BackgroundColor3 = Color3.fromRGB(255,255,255)
local con = Instance.new("UIGridLayout")
con.Parent = widget
	
testButton.MouseButton1Click:Connect(function()
	testButton:Destroy()
	con:Destroy()
	frame.Parent = widget
	frame.Size = UDim2.fromScale(1,1)
	install.Parent = frame
	
end)


