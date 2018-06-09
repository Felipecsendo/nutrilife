require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end
  
  scenario 'and see the Blogs' do
    #cria os dados necessários
    admin = Admin.create(email: 'admin@admin.com', password: '123456', password_confirmation: '123456')
    blog = Blog.create(title: 'Emagrecer', body: 'Passos para emagrecer...', admin: admin )
    blog2 = Blog.create(title: 'Engordar', body: 'Passos para engordar...', admin: admin )
  
    # simula a ação do usuário
    visit root_path
  
    # expectativas do usuário após a ação
    expect(page).to have_css('h3', text: blog.title)
    expect(page).to have_css('li', text: blog.body)
    expect(page).to have_css('li', text: blog.created_at)
    expect(page).to have_css('h3', text: blog2.title)
    expect(page).to have_css('li', text: blog2.body)
    expect(page).to have_css('li', text: blog2.created_at)
  end

  scenario 'and see the categories' do
    #cria os dados necessários
    category1 = Category.create(description: 'Receitas')
    category2 = Category.create(description: 'Exercícios')
    
  
    # simula a ação do usuário
    visit root_path
    
    # expectativas do usuário após a ação
    expect(page).to have_css('a', text: category1.description)
    expect(page).to have_css('a', text: category2.description)
    
  
  end
end
