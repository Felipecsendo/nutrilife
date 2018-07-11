class ApplicationController < ActionController::Base
  # Pundit
  include Pundit

  # Set Layout
  layout :layout_by_resource

  # Manages pundit errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      'backoffice_devise'
    else
      'application'
    end
  end

  def user_not_authorized
    flash[:alert] = t('pundit.you_are_not_authorized_to_perform_this_action')
    redirect_to(request.referer || backoffice_blog_dashboard_index_path)
  end
end
