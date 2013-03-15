if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'PRIEST' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function Fortitude()
		return not (GetRaidBuffTrayAuraInfo(2)) 
	end	
	self:AddStandaloneBuff( 21562, 'checkRequirement', Fortitude ) -- Fortitude

	self:GetCategory('Inner Spells'):addMulti(
		73413,      -- Inner Will
		588        -- Inner Fire
	)
    
	self:AddMultiStandaloneBuffs(
		15473, -- Shadowform
		6346  -- Fear Ward
	)
	
end)
