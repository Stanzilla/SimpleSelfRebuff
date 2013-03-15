if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local UnitExists = UnitExists

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function DarkIntent()
		return not (GetRaidBuffTrayAuraInfo(2) and GetRaidBuffTrayAuraInfo(5))
	end	
	self:AddStandaloneBuff( 109773, 'checkRequirement', DarkIntent ) -- Dark Intent
	
	local function petExists(buff)
		return UnitExists('pet')
	end
	self:AddStandaloneBuff( 108415, 'checkRequirement', petExists ) -- Soul Link

	local function isSwimming(buff)
		return IsSwimming()
	end
	self:AddStandaloneBuff(5697, 'checkRequirement', isSwimming ) -- Unending Breath
end)
