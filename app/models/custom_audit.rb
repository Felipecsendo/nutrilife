class CustomAudit < Audited::Audit
	before_create :audited_admin_name

	def audited_admin_name
		self.username = self.user_type.constantize.find(self.user_id).admin_profile.name
	end
end