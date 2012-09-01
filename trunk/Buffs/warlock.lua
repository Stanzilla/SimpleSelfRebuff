if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local UnitExists = UnitExists

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	
	self:GetCategory('+10% Spellpower'):addMulti(
		109773,	-- Dark Intent
		1459, -- Arcane Brilliance
		61316, -- Dalaran Brilliance
		77747, -- Burning Wrath
		126309 -- Still Water
	)
	
	
	local function petExists(buff)
		return UnitExists('pet')
	end
	
	self:AddStandaloneBuff( 108415, 'checkRequirement', petExists ) -- Soul Link

	local function isSwimming(buff)
		return IsSwimming() or false
	end

	self:AddStandaloneBuff(5697, 'checkRequirement', isSwimming ) -- Unending Breath
end)
