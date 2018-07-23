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

    expect(page).to have_link(t('dashboard'), href: backoffice_dashboard_index_path)
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
    expect(page).to have_css('th', text: t('action'))
    expect(page).to have_css('th', text: t('date/time'))
    
    expect(page).to have_css('td', text: t('messages.admin_was_created', admin_name: admin.admin_profile.name))
    expect(page).to have_css('td', text: admin.admin_creator.admin_profile.name)
    expect(page).to have_css('td', text: admin.created_at.strftime('%B %d, %Y'))
    
    expect(page).to have_css('td', text: t('messages.admin_was_created', admin_name: admin2.admin_profile.name))
    expect(page).to have_css('td', text: admin2.admin_creator.admin_profile.name)
    expect(page).to have_css('td', text: admin2.created_at.strftime('%B %d, %Y'))
    
    expect(page).to have_css('td', text: t('messages.category_was_created', category_description: category.description))
    expect(page).to have_css('td', text: category.admin.admin_profile.name)
    expect(page).to have_css('td', text: category.created_at.strftime('%B %d, %Y'))
    
    expect(page).to have_css('td', text: t('messages.category_was_created', category_description: category2.description))
    expect(page).to have_css('td', text: category2.admin.admin_profile.name)
    expect(page).to have_css('td', text: category2.created_at.strftime('%B %d, %Y'))
    
    expect(page).to have_css('td', text: t('messages.post_was_created', post_title: post.title))
    expect(page).to have_css('td', text: post.admin.admin_profile.name)
    expect(page).to have_css('td', text: post.created_at.strftime('%B %d, %Y'))
    
    expect(page).to have_css('td', text: t('messages.post_was_created', post_title: post2.title))
    expect(page).to have_css('td', text: post2.admin.admin_profile.name)
    expect(page).to have_css('td', text: post2.created_at.strftime('%B %d, %Y'))
  
  end
end
