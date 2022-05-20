--[[
	Manages plugin update checking via a web service.
]]

local RunService = game:GetService("RunService")

local PluginUpdates = {}

-- The unique name of this plugin (to look up in the latest version table)
local PLUGIN_NAME = "RoScratch"
local VERSION_TABLE_ID = 9536358715

-- The cached latest version, as looked up in the latest version table.
PluginUpdates.cachedLatestVersion = nil

--[[
	Returns the version of this local installation.
]]
function PluginUpdates:getVersion()
	return {major = 2, minor = 1, patch = 2}
end

--[[
	Uses a web service to retrieve the latest available version.
	If the web servie isn't available, returns nil.
]]
function PluginUpdates:getLatestVersion()
	-- require() can't be called from a client
	if RunService:IsClient() then
		return nil
	end

	local pluginVersion = nil

	local retrieveOK, err = pcall(function()
		local LatestVersionTable = require(VERSION_TABLE_ID)
		if typeof(LatestVersionTable) ~= "table" then
			error("Can't retrieve latest version")
		end

		pluginVersion = LatestVersionTable[PLUGIN_NAME]
		if typeof(pluginVersion) ~= "table" then
			error("Plugin version entry is missing")
		end
	end)

	if retrieveOK then
		PluginUpdates.cachedLatestVersion = pluginVersion
	else
		warn(PLUGIN_NAME .. " update checker error: " .. err)
	end

	return pluginVersion
end

--[[
	Returns the latest available version, if cached.
	Otherwise, uses a web service to retrieve the latest available version.
]]
function PluginUpdates:getCachedLatestVersion()
	return PluginUpdates.cachedLatestVersion or self:getLatestVersion()
end

--[[
	Returns `true` if the latest available version is newer than the version of
	the current installation.
	
	If the latest version isn't available, returns false.
]]
function PluginUpdates:isUpdateAvailable()
	local current = self:getVersion()
	local latest = self:getCachedLatestVersion()

	if not latest then
		return false
	end

	local versionGreater = latest.major > current.major or latest.minor > current.minor or latest.patch > current.patch

	return versionGreater
end

return PluginUpdates
