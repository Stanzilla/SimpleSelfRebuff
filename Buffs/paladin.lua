if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	-- subcast is used to group blessings
	self:GetCategory(L['Blessing'])
		:add( 20217, 'subcat', 'kings'     ) -- Blessing of Kings
		:add( 19740, 'subcat', 'might'     ) -- Blessing of Might
			
	self:GetCategory(L['Seal']):addMulti( 
		20165, -- Seal of Insight
        20154, -- Seal of Righteousness
		31801 -- Seal of Truth
	)
		
	self:AddStandaloneBuff( 25780 ) -- Righteous Fury

end)
