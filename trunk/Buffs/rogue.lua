if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'ROGUE' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory("Lethal"):addMulti(
		2823, -- Deadly Poison
		8679  -- Wound Poison
	)

	self:GetCategory("Non-Lethal"):addMulti(
		3408, -- Crippling Poison 
		5761  -- Mind-Numbing Poison
	)

end)
