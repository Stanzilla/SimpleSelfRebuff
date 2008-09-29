if not SimpleSelfRebuff then return end
SimpleSelfRebuff:_rev("$Revision$")
if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local UnitExists = UnitExists

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

	self:GetCategory(L['Armor']):addMulti(
		spellNames[687], -- Demon Skin
		spellNames[706], -- Demon Armor
		spellNames[28176] -- Fel Armor
	)
	
	self:AddMultiStandaloneBuffs(
		spellNames[132], -- Detect Invisibility
		spellNames[5697] -- Unending Breath
	)
	
	local function petExists(buff)
		return UnitExists('pet')
	end
	
	self:AddStandaloneBuff( spellNames[19028], 'checkRequirement', petExists ) -- Soul Link
	
end)
