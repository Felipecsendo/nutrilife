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

  private
  def array_or_string_name?(audit)
    value = CustomAudit.where(auditable_type: 'AdminProfile',
                              auditable_id: audit.auditable_id).last.audited_changes['name']
    if value.instance_of? String 
      value
    elsif value.instance_of? Array
      value.first
    end
  end
end
