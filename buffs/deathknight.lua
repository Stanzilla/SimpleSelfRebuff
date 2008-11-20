if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'DEATHKNIGHT' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
    self:AddStandaloneBuff( 49222 ) -- Bone Shield
end) 
