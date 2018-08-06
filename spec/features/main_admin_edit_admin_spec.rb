require 'rails_helper'

feature 'Admin edit other admin', js: true do
  scenario 'successfully, being Full Access Admin', driver: :webkit do
    admin = create(:admin, role: 0)
    create(:admin_profile)
    admin_other = create(:admin, role: 1)
    create(:admin_profile, admin: admin_other)

    name = Faker::Name.unique.name
    email = Faker::Internet.unique.email
    password = '123456'
    image = Rails.root.join('spec',
                            'resources',
                            'images',
                            'blog',
                            "#{Random.rand(1..9)}.jpg")

    login_as(admin, scope: :admin)
    visit(backoffice_admins_path)

    expect(page).to have_css('a.btn.btn-warning.btn-circle',
                             count: Admin.all.count)
    find("a[href='#{edit_backoffice_admin_path(admin_other)}']").click

    fill_in t('name'), with: name
    fill_in t('email'), with: email
    fill_in t('password'), with: password
    fill_in t('password_confirmation'), with: password
    attach_file image
    click_button t('edit')
    click_link t('confirmations.proceed')

    expect(page).to have_css('li', text: t('messages.admin_succesfully_edited',
                                           item_name: name))
    expect(page).to have_css('td', text: admin_other.id)
    expect(page).to have_css('td', text: name)
    expect(page).to have_css('td', text: email)
    expect(page).to have_css('td', text: t('restricted_access'))
  end

  scenario 'successfully, being the profile owner itself', driver: :webkit do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)
    new_name = Faker::Name.unique.name
    new_email = Faker::Internet.unique.email
    password = '123456'
    image = Rails.root.join('spec',
                            'resources',
                            'images',
                            'blog',
                            "#{Random.rand(1..9)}.jpg")

    login_as(admin, scope: :admin)
    visit(backoffice_admins_path)

    find("a[href='#{edit_backoffice_admin_path(admin)}']").click

    fill_in t('name'), with: new_name
    fill_in t('description'), with: 'qwqwqwqw'
    fill_in t('email'), with: new_email
    fill_in t('password'), with: password
    fill_in t('password_confirmation'), with: password
    attach_file image
    click_button t('edit')
    click_link t('confirmations.proceed')

    fill_in placeholder: t('email'), with: new_email
    fill_in placeholder: t('password'), with: password
    click_button 'Log in'
    visit(backoffice_admins_path)

    expect(page).to have_css('td', text: admin.id)
    expect(page).to have_css('td', text: new_name)
    expect(page).to have_css('td', text: new_email)
    expect(page).to have_css('td', text: t('restricted_access'))
  end

  scenario 'but dont have the authorization', driver: :webkit do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)
    admin2 = create(:admin, role: 1)
    create(:admin_profile, admin: admin2)

    login_as(admin, scope: :admin)
    visit(backoffice_admins_path)

    find("a[href='#{edit_backoffice_admin_path(admin2)}']").click

    expect(page)
      .to have_css('li',
                   text: t('pundit' \
                           '.you_are_not_authorized_to_perform_this_action'))
  end

  scenario 'but try it by route without authorization', driver: :webkit do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)
    admin2 = create(:admin, role: 1)
    create(:admin_profile, admin: admin2)

    login_as(admin, scope: :admin)
    visit(edit_backoffice_admin_path(admin2))

    expect(page)
      .to have_css('li',
                   text: t('pundit' \
                           '.you_are_not_authorized_to_perform_this_action'))
  end

  scenario 'successfully, leaving all the same', driver: :webkit do
    admin = create(:admin, role: 1)
    create(:admin_profile, admin: admin)

    login_as(admin, scope: :admin)
    visit(edit_backoffice_admin_path(admin))

    click_button t('edit')
    click_link t('confirmations.proceed')

    expect(page).to have_css('li', text: t('messages.admin_succesfully_edited',
                                           item_name: admin.admin_profile.name))
  end
end
