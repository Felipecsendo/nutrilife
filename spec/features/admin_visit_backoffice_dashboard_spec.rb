require 'rails_helper'

feature 'Admin visit backoffice' do
  scenario 'without authentication' do
    visit backoffice_dashboard_index_path

    expect(current_path).to eq new_admin_session_path
    expect(page)
      .to have_content('Para continuar, faça login ou contate o Administrador')
    find_field(placeholder: 'E-mail').value
    find_field(placeholder: 'Senha').value
  end

  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)

    visit backoffice_dashboard_index_path

    fill_in 'E-mail', with: admin.email
    fill_in 'Senha', with: '123456'
    click_button 'Log in'

    expect(page).to have_css('h4', text: t('last_updates'))
    expect(page).to have_css('li', text: "Olá, #{admin.admin_profile.name}")
    expect(page).to have_css('div.navbar-header a.navbar-brand',
                             text: 'Administração Nutrilife')

    expect(page).to have_css('i.fa.fa-bell.fa-fw')
    expect(page).to have_css('i.fa.fa-caret-down', count: 2)
    expect(page).to have_css('i.fa.fa-user.fa-fw')

    expect(page).to have_link(t('dashboard'),
                              href: backoffice_dashboard_index_path)
  end

  scenario 'and see the last updates' do
    admin = create(:admin)
    create(:admin_profile)
    admin2 = create(:admin)
    create(:admin_profile, admin: admin2)
    category = create(:category)
    category2 = create(:category)
    post = create(:post)
    post2 = create(:post)

    login_as(admin, scope: :admin)
    visit backoffice_dashboard_index_path

    expect(page).to have_css('th', text: t('administrator'))
    expect(page).to have_css('th', text: t('update'))
    expect(page).to have_css('th', text: t('date/time'))

    expect(page)
      .to have_css('td',
                   text: "Criou o Administrador: #{admin.admin_profile.name}")
    expect(page)
      .to have_css('td', text: admin.created_at.strftime('%d/%B/%Y - %H:%M:%S'))

    expect(page)
      .to have_css('td',
                   text: "Criou o Administrador: #{admin2.admin_profile.name}")
    expect(page).to have_css('td', text: admin2
                                         .created_at
                                         .strftime('%d/%B/%Y - %H:%M:%S'))

    expect(page)
      .to have_css('td', text: "Criou a Categoria: #{category.description}")
    expect(page).to have_css('td', text: category.admin.admin_profile.name)
    expect(page).to have_css('td', text: category
                                         .created_at
                                         .strftime('%d/%B/%Y - %H:%M:%S'))

    expect(page)
      .to have_css('td', text: "Criou a Categoria: #{category2.description}")
    expect(page).to have_css('td', text: category2.admin.admin_profile.name)
    expect(page).to have_css('td', text: category2
                                         .created_at
                                         .strftime('%d/%B/%Y - %H:%M:%S'))

    expect(page).to have_css('td', text: "Criou a Postagem: #{post.title}")
    expect(page).to have_css('td', text: post
                                         .admin
                                         .admin_profile.name)
    expect(page).to have_css('td', text: post
                                         .created_at
                                         .strftime('%d/%B/%Y - %H:%M:%S'))

    expect(page).to have_css('td', text: "Criou a Postagem: #{post2.title}")
    expect(page).to have_css('td', text: post2.admin.admin_profile.name)
    expect(page).to have_css('td', text: post2
                                         .created_at
                                         .strftime('%d/%B/%Y - %H:%M:%S'))
  end
end
