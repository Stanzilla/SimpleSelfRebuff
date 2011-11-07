if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	-- subcast is used to group blessings
	self:GetCategory(L['Blessing'])
		:add( 20217, 'subcat', 'kings'     ) -- Blessing of Kings
		:add( 19740, 'subcat', 'might'     ) -- Blessing of Might
			
	self:GetCategory(L['Aura'])
		:add( 465, 'subcat', 'devotion',      'mountFriendly', true ) -- Devotion Aura
		:add( 7294, 'subcat', 'retribution',   'mountFriendly', true ) -- Retribution Aura
		:add( 19891, 'subcat', 'resist',      'mountFriendly', true ) -- Resistance Aura
		:add( 19746, 'subcat', 'concentration', 'mountFriendly', true ) -- Concentration Aura
		:add( 32223, 'subcat', 'crusader',      'mountFriendly', true ) -- Crusader Aura

	self:GetCategory(L['Seal']):addMulti( 
		20164, -- Seal of Justice
		20165, -- Seal of Insight
        20154, -- Seal of Righteousness
		31801 -- Seal of Truth
	)
		
	self:AddStandaloneBuff( 25780 ) -- Righteous Fury

end)
