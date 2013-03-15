if not LibStub then return end
local SimpleSelfRebuff = LibStub("AceAddon-3.0"):GetAddon("SimpleSelfRebuff", true)
if not SimpleSelfRebuff then return end

if select(2, UnitClass('player')) ~= 'DRUID' then return end

local GetShapeshiftForm = GetShapeshiftForm

SimpleSelfRebuff:RegisterBuffSetup(function(self, L)

	-- Specific option for druid
	local db = self.db.profile
	
	self.options.args.general.args.notWhileShapshifted = {
			type = 'toggle',
			name = L["Disable while shapeshifted"],
			desc = L["Disable rebuffing while shapeshifted."],
			width = 'double',
			get  = function() return db.disableWhileShapshifted end,
			set  = function(info, v) 
				db.disableWhileShapshifted = v
				self:CheckRebuff()
			end,		
	}
	
	local function NotShapeshifted()
		return not db.disableWhileShapshifted or GetShapeshiftForm(true) == 0
	end
	self:AddStandaloneBuff(16689, "checkRequirement", NotShapeshifted) -- Nature's Grasp


	local function MarkOfTheWild()
		return not (GetRaidBuffTrayAuraInfo(1))
	end	
	self:AddStandaloneBuff( 1126, 'checkRequirement', MarkOfTheWild ) -- Mark of the Wild
end)
