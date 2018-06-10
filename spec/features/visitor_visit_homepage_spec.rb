require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('a', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end
  
  scenario 'and see the Blogs' do
    #cria os dados necessários
    admin = create(:admin )
    blog = create( :blog )
    blog2 = create( :blog )
  
    # simula a ação do usuário
    visit root_path
  
    # expectativas do usuário após a ação
    expect(page).to have_css('h4', text: blog.title)
    expect(page).to have_css('p', text: blog.body[0..96])
    expect(page).to have_css('a', text: blog.created_at.strftime("%B %d, %Y"))
    expect(page).to have_css('h4', text: blog2.title)
    expect(page).to have_css('p', text: blog2.body[0..96])
    expect(page).to have_css('a', text: blog2.created_at.strftime("%B %d, %Y"))
  end

  scenario 'and see the categories' do
    #cria os dados necessários
    category1 = create(:category )
    category2 = create(:category )
    category3 = create(:category )
    
  
    # simula a ação do usuário
    visit root_path
    
    # expectativas do usuário após a ação
    expect(page).to have_css('a', text: category1.description)
    expect(page).to have_css('a', text: category2.description)
    
  
  end
end
