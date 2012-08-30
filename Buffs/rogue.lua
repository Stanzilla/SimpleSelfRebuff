if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'ROGUE' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory(self.CATEGORY_MAINHAND):addMulti(
		2823, -- Deadly Poison
		7679  -- Wound Poison
	)

	self:GetCategory(self.CATEGORY_OFFHAND):addMulti(
		3408, -- Crippling Poison 
		5761  -- Mind-Numbing Poison
	)

end)
