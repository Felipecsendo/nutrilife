require 'rails_helper'

feature 'Admin visit backoffice' do
  scenario 'without authentication' do
    visit backoffice_blog_dashboard_index_path

    expect(current_path).to eq new_admin_session_path
    expect(page)
      .to have_content('Para continuar, faça login ou contate o Administrador')
    find_field(placeholder: 'E-mail').value
    find_field(placeholder: 'Senha').value
  end

  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)

    visit backoffice_blog_dashboard_index_path

    fill_in 'E-mail', with: admin.email
    fill_in 'Senha', with: '123456'
    click_button 'Log in'

    expect(page).to have_css('h3', text: 'Backoffice Blog Dashboard')
    expect(page).to have_css('li', text: "Olá, #{admin.admin_profile.name}")
    expect(page).to have_css('div.navbar-header a.navbar-brand',
                             text: 'Administração Nutrilife')

    expect(page).to have_css('i.fa.fa-bell.fa-fw')
    expect(page).to have_css('i.fa.fa-caret-down', count: 2)
    expect(page).to have_css('i.fa.fa-user.fa-fw')

    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Dashboard')
    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Post')
    expect(page).to have_css('ul.nav.nav-second-level li a', text: 'Novo Post')
    expect(page).to have_css('ul.nav.nav-second-level li a',
                             text: 'Visualizar Posts')
  end
end
