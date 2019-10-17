local data = {}
name = "DataStore" --Change the Datasore name here!
local datastore = game:GetService("DataStoreService"):GetDataStore(name)
DataToSave = { 					---Edit Data Here!
	Cash = Instance.new("IntValue"),
	XP = Instance.new("IntValue"),
	Level = Instance.new("IntValue"),
	}
function data:onJoin(player)
	script.Parent.Template.GuiMaker.Parent = player.PlayerGui
	
	local stats = Instance.new("Folder")
	stats.Parent = player
	stats.Name = "leaderstats"
	DataToSave.XP.Name = "XP" 
	DataToSave.XP.Parent = stats
	 
	DataToSave.Level.Name = "Level" 
	DataToSave.Level.Parent = stats
	
	DataToSave.Cash.Name = "Cash" 
	DataToSave.Cash.Parent = stats
	 
	local key = "user-" .. player.userId
	
	local storeditems = datastore:GetAsync(key)
	if storeditems then
		DataToSave.XP.Value = storeditems[1] 
		DataToSave.Level.Value = storeditems[2] 
		DataToSave.Cash.Value = storeditems[3] 
		
		
	else
		local items = {DataToSave.XP.Value, DataToSave.Level.Value, DataToSave.Cash.Value} 
		datastore:SetAsync(key, items)
	end

end
function data:onLeave(player)

	local items = {player.leaderstats.XP.Value, player.leaderstats.Level.Value, player.leaderstats.Cash.Value,} 
	local key = "user-" .. player.userId
	
	datastore:SetAsync(key, items)

end

function data:TimeSave(player)
	local items = {player.leaderstats.XP.Value, player.leaderstats.Level.Value, player.leaderstats.Cash.Value,} 
	local key = "user-" .. player.userId	
	datastore:SetAsync(key, items)
end

function data:UpdateCash(valueamt)
	DataToSave.Cash.Value = DataToSave.Cash.Value + valueamt
end
function data:Update(player)
	local items = {player.leaderstats.XP.Value, player.leaderstats.Level.Value, player.leaderstats.Cash.Value,} 
	local key = "user-" .. player.userId	
	datastore:SetAsync(key, items)
	print('updated')
end
function data:UpdateXp(xpamt)
	DataToSave.XP.Value = DataToSave.XP.Value + xpamt
end

function data:AutoUpdate(bool)
	if bool == true then
		game.ReplicatedStorage.ModuleAutoUpdate:FireServer()
	end
end
return data
