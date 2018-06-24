class Backoffice::BlogDashboardController < BackofficeController
  before_action :authenticate_admin!
  
  def index
    
  end

end