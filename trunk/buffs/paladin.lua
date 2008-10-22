if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

	-- subcast is used to group blessings
	self:GetCategory(L['Blessing'])
		:add( spellNames[20217], 'subcat', 'kings'     ) -- Blessing of Kings
		:add( spellNames[19740], 'subcat', 'might'     ) -- Blessing of Might
		:add( spellNames[20911], 'subcat', 'sanctuary' ) -- Blessing of Sanctuary
		:add( spellNames[19742], 'subcat', 'wisdom'    ) -- Blessing of Wisdom
		:add( spellNames[25898], 'subcat', 'kings'     ) -- Greater Blessing of Kings
		:add( spellNames[25782], 'subcat', 'might'     ) -- Greater Blessing of Might
		:add( spellNames[25899], 'subcat', 'sanctuary' ) -- Greater Blessing of Sanctuary
		:add( spellNames[25894], 'subcat', 'wisdom'    ) -- Greater Blessing of Wisdom
	
	self:GetCategory(L['Aura'])
		:add( spellNames[  465], 'subcat', 'devotion',      'mountFriendly', true ) -- Devotion Aura
		:add( spellNames[ 7294], 'subcat', 'retribution',   'mountFriendly', true ) -- Retribution Aura
		:add( spellNames[19891], 'subcat', 'fire_res',      'mountFriendly', true ) -- Fire Resistance Aura
		:add( spellNames[19876], 'subcat', 'shadow_res',    'mountFriendly', true ) -- Shadow Resistance Aura
		:add( spellNames[19888], 'subcat', 'frost_rest',    'mountFriendly', true ) -- Frost Resistance Aura
		:add( spellNames[19746], 'subcat', 'concentration', 'mountFriendly', true ) -- Concentration Aura
		:add( spellNames[32223], 'subcat', 'crusader',      'mountFriendly', true ) -- Crusader Aura

	self:GetCategory(L['Seal'])
		:add( spellNames[21084] ) -- Seal of Righteousness
		:add( spellNames[20164] ) -- Seal of Justice
		:add( spellNames[20165] ) -- Seal of Light
		:add( spellNames[20166] ) -- Seal of Wisdom
		:add( spellNames[31892] ) -- Seal of Blood
		:add( spellNames[31801] ) -- Seal of Vengeance
		:add( spellNames[53736] ) -- Seal of Corruption
		:add( spellNames[53720] ) -- Seal of the Martyr
		
	self:AddStandaloneBuff( spellNames[25780] ) -- Righteous Fury

end)
