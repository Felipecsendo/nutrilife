require 'rails_helper'

feature 'Main admin create new admin' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    
    login_as(admin, scope: :admin)
    visit backoffice_admin_index_path
    
    expect(page).to have_css('btn.btn-success.btn-circle', count: 1)
    find("a[href='#{new_admin_registration_path}']").click
    
    pending("something else getting finished")
    fail
    
 end
end