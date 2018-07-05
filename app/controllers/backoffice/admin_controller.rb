class Backoffice::AdminController < BackofficeController
  
  def index
    @admins = Admin.all
  end
end