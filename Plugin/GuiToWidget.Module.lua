
--== Make from ScreenGui ==--
local function makeFromGui(plugin, screenGui, widgetId, widgetInfo, title)
	local pluginGui = plugin:CreateDockWidgetPluginGui(widgetId, widgetInfo)
	pluginGui.Title = title
	pluginGui.ZIndexBehavior = screenGui.ZIndexBehavior

	for i, v in pairs(screenGui:GetChildren()) do
		v:Clone().Parent = pluginGui
	end

	return pluginGui
end


--== Wrapper ==--
return function(plugin)
	return function(...)
		return makeFromGui(plugin, ...)
	end
end
