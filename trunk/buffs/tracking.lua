if not SimpleSelfRebuff then return end
SimpleSelfRebuff:_rev("$Revision$")

SimpleSelfRebuff:RegisterBuffSetup(function(self, spellNames, L)	

	-- Use 2.3 built-in functions
	local cat = self:GetCategory(self.CATEGORY_TRACKING)
	for i = 1, GetNumTrackingTypes() do
		local name, texture, _, type = GetTrackingInfo(i)
		if type == 'spell' then
			cat:add(name, 'mountFriendly', true, 'texture', texture)
		end
	end
		
end)
