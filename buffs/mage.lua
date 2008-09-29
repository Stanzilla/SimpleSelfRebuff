if not SimpleSelfRebuff then return end
SimpleSelfRebuff:_rev("$Revision$")
if select(2, UnitClass('player')) ~= 'MAGE' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

	self:GetCategory(L['Armor']):addMulti(
		spellNames[ 7302], -- Ice Armor
		spellNames[ 6117], -- Mage Armor
		spellNames[  168], -- Frost Armor
		spellNames[30482]  -- Molten Armor
	)
	
	self:GetCategory(L['Intellect']):addMulti(
		spellNames[ 1459], -- Arcane Intellect
		spellNames[23028], -- Arcane Brilliance
		spellNames[46302]  -- K'iru's Song of Victory -- can not be cast by player but conflicts with AI/AB
	)
	
	self:AddStandaloneBuff( spellNames[11129] ) -- Combustion
	self:AddStandaloneBuff( spellNames[11426] ) -- Ice Barrier
	
	self:GetCategory(L['Magic Alteration']):addMulti(
		spellNames[1008], -- Amplify Magic
		spellNames[ 604]  -- Dampen Magic
	)
	
	self:GetCategory(L['Ward']):addMulti(
    spellNames[ 543], -- Fire Ward
    spellNames[6143]  -- Frost Ward
   )
   	
end)
