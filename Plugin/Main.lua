---== https://github.com/JunkPirate/Scratch-Roblox ==---
---== V1.0 ==---
local toolbar = plugin:CreateToolbar("RoScratch")
local EpicoDefender = script.Parent.Images.Icon.Image
local UI = script.Parent.UI
local Package = script.Parent
local IsActivated = script.Parent.Activation.IsActivated
local active = false

local LoadButton = toolbar:CreateButton("RoScratch","RoScratch", EpicoDefender)
print("RoScratch V1.0 Has Loaded")
print("🆃🅷🅰🅽🅺🆂 🅵🅾🆁 🆄🆂🅸🅽🅶 🆁🅾🆂🅲🆁🅰🆃🅲🅷!")
local MakeWidget = require(Package.GuiToWidget)(plugin)
local Widget = MakeWidget(Package.UI.RoScratch, "RoScratch", DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, false, 500, 500, 500, 500), "RoScratch[V1.0]")
LoadButton:SetActive(Widget.Enabled)
LoadButton.Click:Connect(function()
	Widget.Enabled = not Widget.Enabled
	LoadButton:SetActive(Widget.Enabled)	
end)
Widget.ButtonsFrame.MathsButton.MouseButton1Click:connect(function()
	print("Hello, World!")
	end)
