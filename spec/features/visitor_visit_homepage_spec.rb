require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    category = create(:category, admin: admin)
    create(:post, admin: admin, category: category)

    visit root_path

    expect(page).to have_css('a', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end

  scenario 'and see the Posts' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    category = create(:category, admin: admin)
    post = create(:post, admin: admin, category: category)
    post2 = create(:post, admin: admin,
                          category: category,
                          images: [Rails
                                   .root
                                   .join('public', 'Nutritionist2.jpg').open])

    visit root_path

    expect(page).to have_css('h3', text: post.title)
    expect(page).to have_css('a', text: post.admin.admin_profile.name)
    expect(page).to have_css('p', text: post.body[0..96])
    expect(page).to have_css('a', text: post.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{post.images.first.file.identifier}']")

    expect(page).to have_css('h3', text: post2.title)
    expect(page).to have_css('a', text: post.admin.admin_profile.name)
    expect(page).to have_css('p', text: post2.body[0..96])
    expect(page).to have_css('a', text: post2.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{post2
                                          .images.first.file.identifier}']")
  end

  scenario 'and see the categories' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    category1 = create(:category, admin: admin)
    category2 = create(:category, admin: admin)
    category3 = create(:category, admin: admin)
    create(:post, admin: admin, category: category1)

    visit root_path

    expect(page).to have_css('a', text: category1.description)
    expect(page).to have_css("img[src*='#{category1.avatar.file.identifier}']")

    expect(page).to have_css('a', text: category2.description)
    expect(page).to have_css("img[src*='#{category2.avatar.file.identifier}']")

    expect(page).to have_css('a', text: category3.description)
    expect(page).to have_css("img[src*='#{category3.avatar.file.identifier}']")
  end

  scenario 'and see admin info' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    category = create(:category, admin: admin)
    create(:post, admin: admin, category: category)

    visit root_path

    expect(page).to have_css('h6', text: 'Sobre')
    expect(page).to have_css("img[src*='#{admin
                                          .admin_profile
                                          .avatar.file.identifier}']")

    expect(page).to have_css('h4', text: admin.admin_profile.name)
    expect(page).to have_css('p', text: admin.admin_profile.description)
  end

  scenario 'and see social networks' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    create(:admin_profile, admin: admin)
    category = create(:category, admin: admin)
    create(:post, admin: admin, category: category)

    visit root_path

    expect(page).to have_css('a i.fa.fa-facebook')
    page.find(:css, 'a[href="www.facebook.com"]')

    expect(page).to have_css('a i.fa.fa-instagram')
    page.find(:css, 'a[href="www.instagram.com"]')

    expect(page).to have_css('a i.fa.fa-youtube-play')
    page.find(:css, 'a[href="www.youtube.com"]')
  end
end
