require 'rails_helper'

feature 'Admin destroy Blog Posts', js: true do
  scenario 'successfully', driver: :webkit do
    admin = create(:admin)
    create(:admin_profile)
    category = create(:category)
    blog = create(:blog)
    
    login_as(admin, scope: :admin)
    
    visit backoffice_blog_index_path
    
    click_link('Excluir')
    accept_confirm do
     click_link('Sim')
    end
    
    expect(page).to have_css('p', text: 'Postagem excluída com sucesso!')
    expect(page).not_to have_css('h3', text: blog.title)
    expect(page).not_to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).not_to have_css('p', text: blog.body[0..96])
    expect(page).not_to have_css('a', text: "Criado em: #{blog.created_at.strftime('%B %d, %Y')}")
    expect(page).not_to have_css('a', text: "Atualizado em: #{blog.updated_at.strftime('%B %d, %Y')}")
    expect(page).not_to have_css("img[src*='#{blog.images.first.file.identifier}']")
    
  end
  
  scenario 'but raise an error' do
    pending("something else getting finished")
    fail
  end
end