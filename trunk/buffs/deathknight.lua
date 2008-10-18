if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'DEATHKNIGHT' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)
    self:AddStandaloneBuff( spellNames[49222] ) -- Bone Shield
end) 
