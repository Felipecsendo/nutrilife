class Backoffice::DashboardController < BackofficeController
  def index
    @audits = CustomAudit.all
  end
end