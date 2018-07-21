class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout 'backoffice'

  Audited.current_user_method = :audited_admin
  protected
  def pundit_user
    current_admin
  end

  def audited_admin
    current_admin
  end
end
