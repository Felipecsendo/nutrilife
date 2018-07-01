require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    create(:admin)
    create(:admin_profile)
    create(:category)
    create(:blog)

    visit root_path

    expect(page).to have_css('a', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end

  scenario 'and see the Blogs' do
    # cria os dados necessários
    create(:admin)
    create(:admin_profile)
    create(:category)
    blog = create(:blog)
    blog2 = create(:blog, images: [Rails
                                   .root
                                   .join('public', 'Nutritionist2.jpg').open])

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h3', text: blog.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog.body[0..96])
    expect(page).to have_css('a', text: blog.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{blog.images.first.file.identifier}']")

    expect(page).to have_css('h3', text: blog2.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog2.body[0..96])
    expect(page).to have_css('a', text: blog2.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{blog2
                                          .images.first.file.identifier}']")
  end

  scenario 'and see the categories' do
    # cria os dados necessários
    create(:admin)
    create(:admin_profile)
    category1 = create(:category)
    category2 = create(:category)
    category3 = create(:category)
    create(:blog)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('a', text: category1.description)
    expect(page).to have_css("img[src*='#{category1.avatar.file.identifier}']")

    expect(page).to have_css('a', text: category2.description)
    expect(page).to have_css("img[src*='#{category2.avatar.file.identifier}']")

    expect(page).to have_css('a', text: category3.description)
    expect(page).to have_css("img[src*='#{category3.avatar.file.identifier}']")
  end

  scenario 'and see admin info' do
    # cria os dados necessários
    admin = create(:admin)
    create(:admin_profile)
    create(:category)
    create(:blog)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h6', text: 'Sobre')
    expect(page).to have_css("img[src*='#{admin
                                          .admin_profile
                                          .avatar.file.identifier}']")

    expect(page).to have_css('h4', text: admin.admin_profile.name)
    expect(page).to have_css('p', text: admin.admin_profile.description)
  end
  
  scenario 'and see social networks' do 
    create(:admin)
    create(:admin_profile)
    create(:category)
    create(:blog)

    visit root_path

    expect(page).to have_css('a i.fa.fa-facebook')
    page.find(:css, 'a[href="www.facebook.com"]')
    
    expect(page).to have_css('a i.fa.fa-instagram')
    page.find(:css, 'a[href="www.instagram.com"]')
    
    expect(page).to have_css('a i.fa.fa-youtube-play')
    page.find(:css, 'a[href="www.youtube.com"]')
  end
end
