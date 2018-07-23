module Backoffice::DashboardHelper
  def item_name(audit)
    case audit.auditable_type
      when 'Post' then audit.audited_changes['title']
      when 'Admin'
        CustomAudit.where(auditable_type: 'AdminProfile',
                          auditable_id: audit.auditable_id,
                          action: 'create').first.audited_changes['name']
      when 'AdminProfile'
        if CustomAudit.where(auditable_type: 'AdminProfile',
                          auditable_id: audit.auditable_id,
                          action: 'create').first.nil?
                          audit.auditable_id
        else
          CustomAudit.where(auditable_type: 'AdminProfile',
            auditable_id: audit.auditable_id,
            action: 'create').first.audited_changes['name']
                          end
        
      when 'Category' then audit.audited_changes['description']
      else
        audit.auditable_type
    end
  end
end
