Audited.config do |config|
    config.audit_class = CustomAudit
end
Audited.max_audits = 50
Audited.current_user_method = :authenticated_user

def authenticated_user
    if current_admin
      current_admin.admin_profile.name
    else
      t('unknown')
    end
  end