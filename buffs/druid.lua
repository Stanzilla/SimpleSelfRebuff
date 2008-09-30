if not SimpleSelfRebuff then return end
if select(2, UnitClass('player')) ~= 'DRUID' then return end

local GetShapeshiftForm = GetShapeshiftForm

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)

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
	
	local function checkRequirement()
		return not db.disableWhileShapshifted or GetShapeshiftForm(true) == 0
	end
	
	-- Now the buffs
	
	self:AddStandaloneBuff(spellNames[467], "checkRequirement", checkRequirement) -- Thorns
	self:AddStandaloneBuff(spellNames[16864], "checkRequirement", checkRequirement) -- Omen of Clarity
	self:AddStandaloneBuff(spellNames[16689], "checkRequirement", checkRequirement) -- Nature's Grasp
	
	local cat = self:GetCategory(spellNames[1126]) -- Mark of the Wild
	cat:add(spellNames[1126], "checkRequirement", checkRequirement)
	cat:add(spellNames[21849], "checkRequirement", checkRequirement) -- Gift of the Wild
	
end)
