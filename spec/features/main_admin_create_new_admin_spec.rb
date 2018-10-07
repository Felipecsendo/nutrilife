require 'rails_helper'

feature 'Main admin create new admin' do
  scenario 'successfully' do
    admin = create(:admin, role: 0)
    create(:admin_profile, admin: admin)
    name = Faker::Name.name
    email = Faker::Internet.email
    password = '123456'
    description = Faker::Lorem.sentence
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..16)}.jpg")

    login_as(admin, scope: :admin)
    visit(backoffice_admins_path)

    expect(page).to have_css('a.btn.btn-success.btn-circle', count: 1)
    find('a.btn.btn-success.btn-circle.pull-right').click

    fill_in t('name'), with: name
    fill_in t('email'), with: email
    fill_in t('password'), with: password
    fill_in t('password_confirmation'), with: password
    fill_in t('description'), with: description
    attach_file image
    click_button t('create')

    expect(page).to have_css('li', text: t('messages.admin_succesfully_created',
                                           item_name: name))
    expect(page).to have_css('td', text: '2')
    expect(page).to have_css('td', text: name)
    expect(page).to have_css('td', text: email)
    expect(page).to have_css('td', text: t('restricted_access'))
  end

  scenario 'but leaves blank fields' do
    admin = create(:admin, role: 0)
    create(:admin_profile, admin: admin)

    login_as(admin, scope: :admin)
    visit(new_backoffice_admin_path)

    click_button t('create')

    expect(page).to have_css('li', text: 'Nome não pode ficar em branco')
    expect(page).to have_css('li', text: 'E-mail não pode ficar em branco')
    expect(page).to have_css('li', text: 'Senha não pode ficar em branco')
    expect(page).to have_css('li', text: 'Foto não pode ficar em branco')
    expect(page).to have_css('li', text: 'Descrição não pode ficar em branco')
  end

  scenario 'but dont have the authorization' do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)

    login_as(admin, scope: :admin)
    visit(backoffice_admins_path)

    expect(page).not_to have_css('a.btn.btn-success.btn-circle')
  end

  scenario 'but dont have the authorization and try it by route' do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)

    login_as(admin, scope: :admin)
    visit(new_backoffice_admin_path)

    expect(page)
      .to have_css('li',
                   text: t('pundit' \
                           '.you_are_not_authorized_to_perform_this_action'))
  end
end
