if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'MONK' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function MissingStats()
		return not (GetRaidBuffTrayAuraInfo(1))
	end
	self:AddStandaloneBuff( 115921, 'checkRequirement', MissingStats ) -- Dark Intent

	local function MissingMastery()
		return not (GetRaidBuffTrayAuraInfo(8))
	end
	self:AddStandaloneBuff( 115921, 'checkRequirement', MissingStats ) -- Dark Intent
end)
