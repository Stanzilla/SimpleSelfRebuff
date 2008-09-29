if not SimpleSelfRebuff then return end
SimpleSelfRebuff:_rev("$Revision$")
if select(2, UnitClass('player')) ~= 'WARRIOR' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)
	self:GetCategory(L['Shout']):addMulti(
		spellNames[6673], -- Battle Shout
		spellNames[469] -- Commanding Shout
	)
end)
