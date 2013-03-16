if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'HUNTER' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)
	local function Aspect()
		local aspect = self.db.profile.categories[L["Aspect"]]
		return not UnitAura("player", aspect)
	end

	local buff = self:GetCategory(L['Aspect']):addMulti( 
		5118,  -- Aspect of the Cheetah
		13165, -- Aspect of the Hawk
		109260 -- Aspect of the Iron Hawk
	)
		:add(	13159, 'subcat', 'pack' ) -- Aspect of the Pack
	buff.checkRequirement = Aspect
	

	self:AddMultiStandaloneBuffs(
		77769 -- Trap Launcher
	)

end)
