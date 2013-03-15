if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'WARRIOR' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	self:GetCategory(L['Shout']):addMulti(
		6673, -- Battle Shout
		469 -- Commanding Shout
	)
end)
