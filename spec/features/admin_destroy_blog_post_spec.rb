require 'rails_helper'

feature 'Admin destroy Blog Posts', js: true do
  scenario 'successfully', driver: :webkit do
    admin = create(:admin)
    create(:admin_profile)
    category = create(:category)
    blog = create(:blog)

    login_as(admin, scope: :admin)

    visit backoffice_blog_index_path

    
     click_link('Excluir Postagem')
     click_link('Confirmar')
     

    expect(page).to have_css('li', text: 'Postagem excluída com sucesso!')
    expect(page).not_to have_css('h3', text: blog.title)
    expect(page).not_to have_css('p', text: blog.body[0..96])
    expect(page).not_to have_css('a', text: "Criado em: #{blog.created_at.strftime('%B %d, %Y')}")
    expect(page).not_to have_css('a', text: "Atualizado em: #{blog.updated_at.strftime('%B %d, %Y')}")
    expect(page).not_to have_css("img[src*='#{blog.images.first.file.identifier}']")
    
  end
  
  Capybara.use_default_driver 

end