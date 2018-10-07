require 'rails_helper'

feature 'Main admin see administrators list' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)

    admin2 = create(:admin)
    create(:admin_profile, admin_id: admin2.id)

    admin3 = create(:admin)
    create(:admin_profile, admin_id: admin3.id)

    login_as(admin, scope: :admin)

    visit backoffice_dashboard_index_path

    click_link t('administrators')

    expect(page).to have_css('th', text: '#')
    expect(page).to have_css('th', text: t('name'))
    expect(page).to have_css('th', text: t('email'))
    expect(page).to have_css('th', text: t('authorization'))

    expect(page).to have_css('td', text: admin.id)
    expect(page).to have_css('td', text: admin.admin_profile.name)
    expect(page).to have_css('td', text: admin.email)
    expect(page).to have_css('td', text: t(admin.role))

    expect(page).to have_css('td', text: admin2.id)
    expect(page).to have_css('td', text: admin2.admin_profile.name)
    expect(page).to have_css('td', text: admin2.email)
    expect(page).to have_css('td', text: t(admin2.role))

    expect(page).to have_css('td', text: admin3.id)
    expect(page).to have_css('td', text: admin3.admin_profile.name)
    expect(page).to have_css('td', text: admin3.email)
    expect(page).to have_css('td', text: t(admin3.role))
  end
end
