if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PALADIN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	-- subcat is used to group blessings
	self:GetCategory(L['Blessing'])
		:add( 20217, 'subcat', 'kings'     ) -- Blessing of Kings
		:add( 19740, 'subcat', 'might'     ) -- Blessing of Might
			
	self:AddStandaloneBuff( 25780 ) -- Righteous Fury

end)
