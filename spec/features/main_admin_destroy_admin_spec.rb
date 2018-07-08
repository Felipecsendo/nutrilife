require 'rails_helper'

feature 'Main admin destroy other admin', js: true do
  scenario 'successfully', driver: :webkit do
    admin = create(:admin, role: 0)
    create(:admin_profile)
    
    admin2 = create(:admin)
    create(:admin_profile, admin_id: admin2.id)
    
    login_as(admin, scope: :admin)
    visit backoffice_admin_index_path
    
    expect(page).to have_css('a.btn.btn-danger.btn-circle', count: Admin.all.count)
    find("a[href='#{backoffice_admin_path(admin2)}']").click
    click_link t('confirmations.proceed')
    
    expect(page).to have_css('li', text: t('messages.admin_succesfully_destroyed',
                                            admin_name: admin2.admin_profile.name))
    expect(page).not_to have_css('td', text: admin2.id )
    expect(page).not_to have_css('td', text: admin2.admin_profile.name )
    expect(page).not_to have_css('td', text: admin2.email )
    expect(page).not_to have_css('td', text: t('restricted_access'))
    
 end
end