if not SimpleSelfRebuff then return end
SimpleSelfRebuff:_rev("$Revision$")
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

	-- subcast is used to group blessings
	self:GetCategory(L['Blessing'])
		:add( spellNames[20217], 'subcat', 'kings'     ) -- Blessing of kight
		:add( spellNames[19977], 'subcat', 'light'     ) -- Blessing of Light
		:add( spellNames[19740], 'subcat', 'might'     ) -- Blessing of Might
		:add( spellNames[ 1038], 'subcat', 'salvation' ) -- Blessing of Salvation
		:add( spellNames[20911], 'subcat', 'sanctuary' ) -- Blessing of Sanctuary
		:add( spellNames[19742], 'subcat', 'wisdom'    ) -- Blessing of Wisdom
		:add( spellNames[25898], 'subcat', 'kings'     ) -- Greater Blessing of Kings
		:add( spellNames[25890], 'subcat', 'light'     ) -- Greater Blessing of Light
		:add( spellNames[25782], 'subcat', 'might'     ) -- Greater Blessing of Might
		:add( spellNames[25895], 'subcat', 'salvation' ) -- Greater Blessing of Salvation
		:add( spellNames[25899], 'subcat', 'sanctuary' ) -- Greater Blessing of Sanctuary
		:add( spellNames[25894], 'subcat', 'wisdom'    ) -- Greater Blessing of Wisdom
	
	self:GetCategory(L['Aura'])
		:add( spellNames[  465], 'subcat', 'devotion',      'mountFriendly', true ) -- Devotion Aura
		:add( spellNames[ 7294], 'subcat', 'retribution',   'mountFriendly', true ) -- Retribution Aura
		:add( spellNames[20218], 'subcat', 'sanctity',      'mountFriendly', true ) -- Sanctity Aura
		:add( spellNames[19891], 'subcat', 'fire_res',      'mountFriendly', true ) -- Fire Resistance Aura
		:add( spellNames[19876], 'subcat', 'shadow_res',    'mountFriendly', true ) -- Shadow Resistance Aura
		:add( spellNames[19888], 'subcat', 'frost_rest',    'mountFriendly', true ) -- Frost Resistance Aura
		:add( spellNames[19746], 'subcat', 'concentration', 'mountFriendly', true ) -- Concentration Aura
		:add( spellNames[32223], 'subcat', 'crusader',      'mountFriendly', true ) -- Crusader Aura

	self:AddStandaloneBuff( spellNames[25780] ) -- Righteous Fury

end)
