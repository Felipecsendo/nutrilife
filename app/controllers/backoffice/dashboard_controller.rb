class Backoffice::DashboardController < BackofficeController
  def index
    @banana = Category.all
    @audits = CustomAudit.all.reverse
  end
end