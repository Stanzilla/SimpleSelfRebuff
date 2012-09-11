if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'HUNTER' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory(L['Aspect']):addMulti( 
		--34074, -- Aspect of the Viper
		--13161, -- Aspect of the Beast
		5118,  -- Aspect of the Cheetah
		13165, -- Aspect of the Hawk
	    82661, -- Aspect of the Fox
		109260 -- Aspect of the Iron Hawk
		--13163, -- Aspect of the Monkey
		--61846  -- Aspect of the Dragonhawk
	)
		:add(	13159, 'subcat', 'pack' ) -- Aspect of the Pack

	self:AddMultiStandaloneBuffs(
		77769 -- Trap Launcher
	)

end)
