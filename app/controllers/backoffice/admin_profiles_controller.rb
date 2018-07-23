class Backoffice::AdminProfilesController < BackofficeController
  before_action :set_admin_profile, only: [:edit, :update, :destroy]
  
  
  def edit
    authorize @admin
  end
  
  def update
    if @admin.update(admin_profiles_params)
      redirect_to  backoffice_admins_path,
                  notice: t('messages.admin_succesfully_edited',
                  item_name: @admin.admin_profile.name)
    else
      helpers.message_notices(@admin)
      render :edit
    end
  end
  
  private
  
  def admin_profiles_params
    params.require(:admin_profile).permit(:email, :password, :password_confirmation,
                                  admin_profile_attributes:[:name,
                                                            :description,
                                                            :avatar])
  end
  
  def set_admin_profile
    @admin_profile = AdminProfile.find_or_create(params[:id])
  end
end