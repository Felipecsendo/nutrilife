require 'rails_helper'

feature 'Main admin create new admin' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    name = Faker::Name.name
    email = Faker::Internet.email
    password = '123456'
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..16)}.jpg")
    
    login_as(admin, scope: :admin)
    visit(backoffice_admin_index_path)
    
    expect(page).to have_css('a.btn.btn-success.btn-circle', count: 1)
    find('a.btn.btn-success.btn-circle.pull-right').click
    
    fill_in t('name'), with: name
    fill_in t('email'), with: email
    fill_in t('password'), with: password
    fill_in t('password_confirmation'), with: password
    attach_file image
    click_button t('create')
    
    expect(page).to have_css('li', text: t('messages.admin_succesfully_created',
                                            admin_name: name))
    expect(page).to have_css('td', text: '2' )
    expect(page).to have_css('td', text: name )
    expect(page).to have_css('td', text: email )
    expect(page).to have_css('td', text: t('restricted_access'))
    
    
 end
end