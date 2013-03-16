if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'MAGE' then return end

local function Brilliance() 
	return not (GetRaidBuffTrayAuraInfo(5) and GetRaidBuffTrayAuraInfo(7)) 
end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function Armor()
		local armor = self.db.profile.categories[L["Armor"]]
		return not UnitAura("player", armor)
	end

	local buff = self:GetCategory(L['Armor']):addMulti(
		7302, -- Ice Armor
		6117, -- Mage Armor
		30482  -- Molten Armor
	)
	buff.checkRequirement = Armor

	
	local buff = self:GetCategory(L['Intellect']):addMulti(
		1459, -- Arcane Brilliance
	        61316 -- Dalaran Brilliance
	)
	buff.checkRequirement = Brilliance 

	self:AddStandaloneBuff( 11426 ) -- Ice Barrier
end)
