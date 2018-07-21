Audited.config do |config|
    config.audit_class = CustomAudit
end
Audited.current_user_method = :audited_admin

def audited_admin
  if current_admin
      current_admin
  else
      Admin.first
  end
end