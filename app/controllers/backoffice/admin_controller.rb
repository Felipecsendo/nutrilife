class Backoffice::AdminController < BackofficeController
  
  def index
    @admins = Admin.all
  end
  
  def new
    @admin = Admin.new
    @admin.build_admin_profile
  end
  
  def create
    @admin = Admin.new(admin_params)
    @admin.role = 1
    if @admin.save
      redirect_to backoffice_admin_index_path,
                  notice: t('messages.admin_succesfully_created',
                            admin_name: @admin.admin_profile.name)
    else
      render :new
    end
  end
  
  
  private
  
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation,
                                  admin_profile_attributes:[:name,
                                                            :description,
                                                            :avatar])
  end
end