if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PRIEST' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	
	self:GetCategory(L['Fortitude']):addMulti(
		1243,  -- Power Word: Fortitude
		21562, -- Prayer of Fortitude 
		46302  -- K'iru's Song of Victory -- can not be cast by player but conflicts with PW:F/PF		
	)
	
	self:GetCategory(L['Spirit']):addMulti(
		14752, -- Divine Spirit
		27681  -- Prayer of Spirit
	)

	self:GetCategory(976):addMulti( -- Shadow Protection
  	976,  -- Shadow Protection
  	27683 -- Prayer of Shadow Protection
  )

	self:AddMultiStandaloneBuffs(	
		588,   -- Inner Fire
		15473, -- Shadowform
		--2651,  -- Elune's Grace
		--18137, -- Shadowguard
		--2652,  -- Touch of Weakness
		6346   -- Fear Ward
	)
	
end)
