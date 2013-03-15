if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'MAGE' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory(L['Armor']):addMulti(
		7302, -- Ice Armor
		6117, -- Mage Armor
		30482  -- Molten Armor
	)
	
	self:AddStandaloneBuff( 11426 ) -- Ice Barrier
	
	local buff = self:GetCategory(L['Intellect']):addMulti(
		1459, -- Arcane Brilliance
	        61316 -- Dalaran Brilliance
	)
	buff.checkRequirement = function() return not (GetRaidBuffTrayAuraInfo(5) and GetRaidBuffTrayAuraInfo(7)) end
end)
