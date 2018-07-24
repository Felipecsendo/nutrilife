module Backoffice::DashboardHelper
  def item_name(audit)
    case audit.auditable_type
      when 'Post' then audit.audited_changes['title']
      when 'Admin', 'AdminProfile'
        value = AdminProfile.find(audit.auditable_id).name
      when 'Category' then audit.audited_changes['description']
      else
        audit.auditable_type
    end
  end
end
