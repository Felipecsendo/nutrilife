require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end

end
