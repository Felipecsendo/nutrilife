require 'rails_helper'

feature 'Visitor visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'NutriLife')
    expect(page).to have_css('p', text: 'Bem-vindo ao Mundo Saudável')
  end

  scenario 'and view the last recipes' do
    #cria os dados necessários
    recipe = create(:recipe)

    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h3', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type.name)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end

  scenario 'and view recipes list' do
    Faker::UniqueGenerator.clear
    #cria os dados necessários
    recipes = create_list(:recipe, 10)
    
    visit root_path
    
    recipes.drop(4).each do |recipe|
    expect(page).to have_css('h3', text:  recipe.title)
    expect(page).to have_css('li', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).to have_css('li', text: "Tipo: #{recipe.recipe_type.name}")
    expect(page).to have_css('li', text: "Dificuldade: #{recipe.difficulty}")
    end
    
    recipes.take(4).each do |recipe|
    expect(page).not_to have_css('h3', text:  recipe.title)
    expect(page).not_to have_css('li', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).not_to have_css('li', text: "Tipo: #{recipe.recipe_type.name}")
    end  
  end
  
  scenario 'and see the top 3 favorites' do 
    Faker::UniqueGenerator.clear
    recipes = create_list(:recipe, 10)
    Favorite.create(user: recipes[0].user, recipe: recipes[0])
    Favorite.create(user: recipes[1].user, recipe: recipes[0])
    Favorite.create(user: recipes[2].user, recipe: recipes[0])
    
    Favorite.create(user: recipes[3].user, recipe: recipes[1])
    Favorite.create(user: recipes[4].user, recipe: recipes[1])
    
    Favorite.create(user: recipes[5].user, recipe: recipes[5])
    Favorite.create(user: recipes[6].user, recipe: recipes[5])
    
    Favorite.create(user: recipes[7].user, recipe: recipes[3])
    Favorite.create(user: recipes[8].user, recipe: recipes[4])
    Favorite.create(user: recipes[9].user, recipe: recipes[2])
    
    visit root_path
    
    recipes.values_at(0, 1, 5).each do |recipe|
    expect(page).to have_css('div.most_favorited', text:  recipe.title)
    expect(page).to have_css('div.most_favorited', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).to have_css('div.most_favorited', text: "Tipo: #{recipe.recipe_type.name}")
    expect(page).to have_css('div.most_favorited', text: "Dificuldade: #{recipe.difficulty}")
    end
    
    recipes.values_at(2, 3, 4, 6, 7, 8, 9).each do |recipe|
    expect(page).not_to have_css('div.most_favorited', text:  recipe.title)
    expect(page).not_to have_css('div.most_favorited', text: "Cozinha: #{recipe.cuisine.name}")
    expect(page).not_to have_css('div.most_favorited', text: "Tipo: #{recipe.recipe_type.name}")
    end  
  end
  
  scenario 'and see featured recipes if any' do
    Faker::UniqueGenerator.clear
    create(:recipe, featured: true)
    create(:recipe)
    
    visit root_path
    expect(page).to have_css("img[src*='star']")
  end
  
    scenario 'and dont see featured recipes if has no featured' do
    Faker::UniqueGenerator.clear
    create(:recipe)
    create(:recipe)
    
    visit root_path
    expect(page).not_to have_css("img[src*='star']")
  end
end
