class CustomAudit < Audited::Audit
	before_save :audited_admin_name

	def audited_admin_name
		if self.user_type
			self.username = self.user_type.constantize.find(self.user_id).admin_profile.name
		else
			self.username = I18n.t('unknown')			
		end
	end
end