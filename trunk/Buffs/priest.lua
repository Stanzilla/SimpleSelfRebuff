if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PRIEST' then return end

local function Fortitude()
	return not GetRaidBuffTrayAuraInfo(2)
end	

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local buff = self:AddStandaloneBuff(21562) -- Fortitude
	buff.checkRequirement = Fortitude

	local function Inner()
		local inner = self.db.profile.categories["Inner Spells"]
		return not UnitAura("player", inner)
	end
	local buff = self:GetCategory('Inner Spells'):addMulti(
		73413,      -- Inner Will
		588        -- Inner Fire
	)
	buff.checkRequirement = Inner

	self:AddMultiStandaloneBuffs(
		15473, -- Shadowform
		6346  -- Fear Ward
	)
end)
