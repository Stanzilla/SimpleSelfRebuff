if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'SHAMAN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)
	
	self:GetCategory(L['Elemental Shield']):addMulti(
		spellNames[  324], -- Lightning Shield
		spellNames[24398], -- Water Shield
		spellNames[  974]  -- Earth Shield   
	)

	self:GetCategory(self.CATEGORY_MAINHAND):addMulti(
		spellNames[8024], -- Flametongue Weapon
		spellNames[8033], -- Frostbrand Weapon
		spellNames[8017], -- Rockbiter Weapon
		spellNames[8232]  -- Windfury Weapon    
	)

	self:GetCategory(self.CATEGORY_OFFHAND):addMulti(
		spellNames[8024], -- Flametongue Weapon
		spellNames[8033], -- Frostbrand Weapon
		spellNames[8017], -- Rockbiter Weapon
		spellNames[8232]  -- Windfury Weapon    
	)
	
end)
