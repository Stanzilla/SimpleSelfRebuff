if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'PRIEST' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	
	self:GetCategory(L['Fortitude']):addMulti(
		79105,  -- Power Word: Fortitude
        6307,   -- Blood Pact
		469,    -- Commanding Shout
		46302   -- K'iru's Song of Victory -- can not be cast by player but conflicts with PW:F/PF		
	)
	
    self:GetCategory('Inner Spells'):addMulti(
		73413,      -- Inner Will
        588        -- Inner Fire
	)
    
	self:AddMultiStandaloneBuffs(
        15473, -- Shadowform
		6346  -- Fear Ward
	)
	
end)
