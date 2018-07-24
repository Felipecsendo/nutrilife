class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    @admins = Admin.all
    @current_admin = current_admin
  end
  
  def new
    @admin = Admin.new
    @admin.build_admin_profile
    authorize @admin 
  end
  
  def create
    @admin = Admin.new(admin_params)
    @admin.role = 1
    if @admin.save
      redirect_to  backoffice_admins_path,
                  notice: t('messages.admin_succesfully_created',
                            item_name: @admin.admin_profile.name)
    else
      helpers.message_notices(@admin)
      render :new
    end
  end
  
  def edit
    authorize @admin
  end
  
  def update
    if @admin.update(admin_params)
      redirect_to  backoffice_admins_path,
                  notice: t('messages.admin_succesfully_edited',
                  item_name: @admin.admin_profile.name)
    else
      helpers.message_notices(@admin)
      render :edit
    end
  end
  
  def destroy
    authorize @admin
    if @admin.destroy
      redirect_to  backoffice_admins_path,
                  notice: t('messages.admin_succesfully_destroyed',
                  item_name: @admin.admin_profile.name)
    else
      helpers.message_notices(@admin)
      redirect_to  backoffice_admins_path
    end
  end
  
  private
  
  def admin_params
    if password_blank?
      params[:admin].extract! :password, :password_confirmation
    end
    if avatar_blank?
      params[:admin].extract! admin_profile_attributes:[:avatar]
    end
    params.require(:admin).permit(:email, :password, :password_confirmation,
                                  admin_profile_attributes:[:name,
                                                            :description,
                                                            :avatar])

  end
  
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def password_blank?
    params[:admin][:password].blank? &&
    params[:admin][:password_confirmation].blank?
  end

  def avatar_blank?
    params[:admin][:avatar].blank?
  end
end