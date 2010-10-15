if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local UnitExists = UnitExists

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory(L['Armor']):addMulti(
		687, -- Demon armor
		28176 -- Fel Armor
	)
	
	self:AddMultiStandaloneBuffs(
		5697 -- Unending Breath
	)
	
	local function petExists(buff)
		return UnitExists('pet')
	end
	
	self:AddStandaloneBuff( 19028, 'checkRequirement', petExists ) -- Soul Link
	
end)
