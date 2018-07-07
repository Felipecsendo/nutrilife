require 'rails_helper'

feature 'Main admin edit other admin', js: true do
  scenario 'successfully', driver: :webkit do
   admin = create(:admin, role: 0)
   create(:admin_profile)
   admin_other = create(:admin, role: 1)
   create(:admin_profile, admin: admin_other)

    name = Faker::Name.unique.name
    email = Faker::Internet.unique.email
    password = '123456'
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..16)}.jpg")
    
    login_as(admin, scope: :admin)
    visit(backoffice_admin_index_path)
    
    expect(page).to have_css('a.btn.btn-warning.btn-circle.pull-left', count: Admin.all.count)
    find("a[href='#{edit_backoffice_admin_path(admin_other)}']").click
    
    fill_in t('name'), with: name
    fill_in t('email'), with: email
    fill_in t('password'), with: password
    fill_in t('password_confirmation'), with: password
    attach_file image
    click_button t('edit')
    click_link t('confirmations.proceed')
    
    expect(page).to have_css('li', text: t('messages.admin_succesfully_edited',
                                            admin_name: name))
    expect(page).to have_css('td', text: admin_other.id )
    expect(page).to have_css('td', text: name )
    expect(page).to have_css('td', text: email )
    expect(page).to have_css('td', text: t('restricted_access'))
    
 end
end