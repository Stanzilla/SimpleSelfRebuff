if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'SHAMAN' then return end

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	self:GetCategory(L['Elemental Shield']):addMulti(
		  324, -- Lightning Shield
		52127, -- Water Shield
		  974  -- Earth Shield
	)

	self:GetCategory(self.CATEGORY_MAINHAND):addMulti(
		8024, -- Flametongue Weapon
		8033, -- Frostbrand Weapon
		8017, -- Rockbiter Weapon
		8232, -- Windfury Weapon
		51730 -- Earthliving Weapon
	)

	self:GetCategory(self.CATEGORY_OFFHAND):addMulti(
		8024, -- Flametongue Weapon
		8033, -- Frostbrand Weapon
		8017, -- Rockbiter Weapon
		8232, -- Windfury Weapon
		51730 -- Earthliving Weapon
	)

	local function isSwimming(buff)
		return IsSwimming()
	end

	self:AddStandaloneBuff(546, 'checkRequirement', isSwimming ) -- Water Walking
end)
