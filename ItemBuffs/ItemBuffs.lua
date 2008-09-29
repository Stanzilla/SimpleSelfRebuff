if not SimpleSelfRebuff then return end
local SimpleSelfRebuff = SimpleSelfRebuff
SimpleSelfRebuff:_rev("$Revision$")

local ItemBuffs = SimpleSelfRebuff:NewModule("ItemBuffs")

function ItemBuffs:OnEnable()

	local L = SimpleSelfRebuff.L
	local new, del = SimpleSelfRebuff.new, SimpleSelfRebuff.del

	local PT3 = LibStub('LibPeriodicTable-3.1')

	local SOURCE_PT3SET = 'itemset'
	SimpleSelfRebuff.SOURCE_PT3SET = SOURCE_PT3SET

	local PT3SetBuff = SimpleSelfRebuff.classes.BuffSource:new(SOURCE_PT3SET, isUsableSetItem, getSetItemCooldown)
	LibStub("AceBucket-3.0"):Embed(PT3SetBuff)
	SimpleSelfRebuff.buffTypes.PT3Set = PT3SetBuff

	function PT3SetBuff:OnEnable()
		if next(self.allBuffs) then
			self:RegisterBucketEvent('BAG_UPDATE', 0.5, 'FindBestItems')
			self:FindBestItems()
		end
	end

	function PT3SetBuff:OnBuffRegister(buff)
		if not buff.setName then
			error("setName is missing for PT3SetBuff %q", buff.name)
		end

		local itemids = new()
		local values = new()

		buff.itemids = itemids
		buff.found = true

		for itemid, value in PT3:IterateSet(buff.setName) do
			tinsert(itemids, itemid)
			values[itemid] = tonumber(value) or 1
		end

		local function sorter(a,b)
			return values[a] > values[b]
		end
		table.sort(itemids, sorter)

		values = del(values)
	end

	function PT3SetBuff:FindBestItems()
		for buff in pairs(self.allBuffs) do
			local newItemid, newItemName
			for i,itemid in ipairs(buff.itemids) do
				if GetItemCount(itemid) > 0 then
					newItemid, newItemName = itemid, GetItemInfo(itemid)
					break
				end
			end
			if newItemid ~= buff.currentItemid then
				self:Debug("New item for %q: %q (%q)", buff.name, newItemid, itemName)
				buff.currentItemid = newItemid
				buff.currentItemName = newItemName
			end
		end
	end

	function PT3SetBuff:SetupSecureButton(buff, button)
		self:Debug('Setup %s using item %q', buff.name, buff.currentItemName)
		button:SetAttribute('*type*', 'item')
		button:SetAttribute('*item*', buff.currentItemName)
	end

	function PT3SetBuff:_IsBuffUsable(buff)
		return buff and buff.currentItemid and IsUsableItem(buff.currentItemid)
	end

	function PT3SetBuff:_GetBuffCooldown(buff)
		if buff and buff.currentItemid then
			return GetItemCooldown(buff.currentItemid)
		end
	end

	-------------------------------------------------------------------------------
	-- Items declaration
	-------------------------------------------------------------------------------

	SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)
		local class = select(2, UnitClass('player'))

		local function registerItems(categoryName)

			local category = self:GetCategory(categoryName)
			category.source = SOURCE_PT3SET

			-- Stones
			if true or
				class == 'ROGUE'  or class == 'WARRIOR' or class == 'PALADIN' or
				class == 'SHAMAN' or class == 'DRUID'
			then
				category
					:add( L["Sharpening Stone"], 'setName', 'Consumable.Weapon Buff.Stone.Sharpening Stone' )
					:add( L["Weight Stone"], 'setName', 'Consumable.Weapon Buff.Stone.Weight Stone' )
			end

			-- Oils
			if
				class == 'WARLOCK' or class == 'DRUID'  or class == 'MAGE' or class == 'SHAMAN' or
				class == 'PALADIN' or class == 'PRIEST' or class == 'HUNTER'
			then

				-- Mana Oils
				category:add( L["Mana Oil"], 'minLevel', 20, 'setName', "Consumable.Weapon Buff.Oil.Mana")

				-- Wizard Oils
				if class ~= 'HUNTER' then
					category:add( L["Wizard Oil"], 'minLevel', 5, 'setName', "Consumable.Weapon Buff.Oil.Wizard" )
				end

			end

			if class == 'ROGUE' then
				category
					:add( spellNames[26786], 'minLevel', 68, 'setName', 'Consumable.Weapon Buff.Poison.Anesthetic'   ) -- Anesthetic Poison
					:add( spellNames[ 3420], 'minLevel', 20, 'setName', 'Consumable.Weapon Buff.Poison.Crippling'    ) -- Crippling Poison
					:add( spellNames[ 2835], 'minLevel', 30, 'setName', 'Consumable.Weapon Buff.Poison.Deadly'       ) -- Deadly Poison
					:add( spellNames[ 8681], 'minLevel', 20, 'setName', 'Consumable.Weapon Buff.Poison.Instant'      ) -- Instant Poison
					:add( spellNames[ 5763], 'minLevel', 24, 'setName', 'Consumable.Weapon Buff.Poison.Mind Numbing' ) -- Mind-numbing Poison
					:add( spellNames[13220], 'minLevel', 32, 'setName', 'Consumable.Weapon Buff.Poison.Wound'        ) -- Wound Poison
			end

		end

		registerItems(self.CATEGORY_MAINHAND)
		registerItems(self.CATEGORY_OFFHAND)

	end)

end
