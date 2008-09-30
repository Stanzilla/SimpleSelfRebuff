if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'HUNTER' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

	self:GetCategory(L['Aspect']):addMulti( 
		spellNames[34074], -- Aspect of the Viper
		spellNames[13161], -- Aspect of the Beast
		spellNames[5118],  -- Aspect of the Cheetah
		spellNames[13165], -- Aspect of the Hawk
		spellNames[13163]  -- Aspect of the Monkey
	)
		:add(	spellNames[13159], 'subcat', 'pack' ) -- Aspect of the Pack
		:add(	spellNames[20043], 'subcat', 'wild' ) -- Aspect of the Wild

	self:AddStandaloneBuff( spellNames[19506] ) -- Trueshot Aura
	
end)
