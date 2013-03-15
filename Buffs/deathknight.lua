if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'DEATHKNIGHT' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
    self:AddStandaloneBuff(49222) -- Bone Shield
    self:AddStandaloneBuff(57330) -- Horn of Winter
	
	self:GetCategory("Presence"):addMulti(
		48263, -- Blood Presence
		48266, -- Frost Presence
		48265 -- Unholy Presence
	)
end) 
