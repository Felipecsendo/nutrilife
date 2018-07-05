require 'rails_helper'

feature 'Main admin destroy other admin' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    
    admin2 = create(:admin)
    create(:admin_profile, admin_id: admin2.id)
    
    login_as(admin, scope: :admin)
    visit backoffice_admin_index_path
    
    expect(page).to have_css('btn.btn-danger.btn-circle', count: Admin.all.count)
    
    pending("something else getting finished")
    fail
    
 end
end