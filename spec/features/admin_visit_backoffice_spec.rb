require 'rails_helper'

feature 'Admin visit backoffice' do
  scenario 'successfully' do

    visit backoffice_blog_dashboard_index_path

    expect(page).to have_css('h3', text: 'Backoffice Blog Dashboard')
    expect(page).to have_css('div.navbar-header a.navbar-brand', text: 'Administração Nutrilife')

  end

  scenario 'and see Navigation Topbar' do

    visit backoffice_blog_dashboard_index_path

    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-bell.fa-fw')
    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-caret-down', count: 2)
    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-user.fa-fw')

  end

  scenario 'and see Navigation Sidebar' do

    visit backoffice_blog_dashboard_index_path

    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Dashboard')
    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Blog')
    expect(page).to have_css('ul.nav.nav-second-level li a', text: 'Novo Post')
    expect(page).to have_css('ul.nav.nav-second-level li a', text: 'Visualizar Posts')

  end
  
  scenario 'and click on see all Posts' do
    create(:admin )
    create(:admin_profile)
    create(:category )
    blog = create( :blog )
    blog2 = create( :blog, images: [Rails.root.join('public', "Nutritionist2.jpg").open] )
    
    visit backoffice_blog_dashboard_index_path

    click_link('Visualizar Posts')

    expect(page).to have_current_path(backoffice_blog_index_path)

    expect(page).to have_css('h3', text: blog.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog.body[0..96])
    expect(page).to have_css('a', text: blog.created_at.strftime("%B %d, %Y"))
    expect(page).to have_css("img[src*='#{blog.images.first.file.identifier}']")
    
    expect(page).to have_css('h3', text: blog2.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog2.body[0..96])
    expect(page).to have_css('a', text: blog2.created_at.strftime("%B %d, %Y"))
    expect(page).to have_css("img[src*='#{blog2.images.first.file.identifier}']")
    

  end
  
  scenario 'and click on new Post' do
    admin = create(:admin )
    create(:admin_profile)
    category = create(:category)
    title = Faker::Dessert.variety
    body = LeroleroGenerator.sentence(3)
    image = [Rails.root.join('public',
                                 'templates',
                                 'yummy',
                                 'img',
                                 'blog-img',
                                 "#{Random.rand(1..16)}.jpg")
                                 .open]
    visit backoffice_blog_dashboard_index_path

    click_link('Novo Post')
    
    fill_in 'Título', with: title
    fill_in 'Conteúdo', with: body
    select(category.description, from: 'Select Box')
    attach_file image
    click_button('Criar')
                                 
    expect(page).to have_current_path(backoffice_blog_index_path)
    
    expect(page).to have_css('h3', text: title)
    expect(page).to have_css('a', text: admin.admin_profile.name)
    expect(page).to have_css('p', text: body[0..96])
    expect(page).to have_css('a', text: Time.now.strftime("%B %d, %Y"))
    expect(page).to have_css("img[src*='#{File.basename(image.first)}']")

  end

end
