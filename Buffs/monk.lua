if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'MONK' then return end

local stats = GetSpellInfo(115921)
local mastery = GetSpellInfo(116781)

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function BuffCheck()
		if self.db.profile.categories[L['Legacy']] == mastery then
			return not GetRaidBuffTrayAuraInfo(8)
		elseif self.db.profile.categories[L['Legacy']] == stats then
			return not GetRaidBuffTrayAuraInfo(1)
		end
	end
	local buff = self:GetCategory(L['Legacy'])
		:add( 115921, 'subcat', 'stats')   -- Legacy of the Emperor
		:add( 116781, 'subcat', 'mastery') -- Legacy of the White Tiger
	buff.checkRequirement = BuffCheck
end)
