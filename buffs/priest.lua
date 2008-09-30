if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PRIEST' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)
	
	self:GetCategory(L['Fortitude']):addMulti(
		spellNames[1243],  -- Power Word: Fortitude
		spellNames[21562], -- Prayer of Fortitude 
		spellNames[46302]  -- K'iru's Song of Victory -- can not be cast by player but conflicts with PW:F/PF		
	)
	
	self:GetCategory(L['Spirit']):addMulti(
		spellNames[14752], -- Divine Spirit
		spellNames[27681]  -- Prayer of Spirit
	)

	self:GetCategory(spellNames[976]):addMulti( -- Shadow Protection
  	spellNames[976],  -- Shadow Protection
  	spellNames[27683] -- Prayer of Shadow Protection
  )

	self:AddMultiStandaloneBuffs(	
		spellNames[588],   -- Inner Fire
		spellNames[15473], -- Shadowform
		spellNames[2651],  -- Elune's Grace
		spellNames[18137], -- Shadowguard
		spellNames[2652],  -- Touch of Weakness
		spellNames[6346]   -- Fear Ward
	)
	
end)
