require 'rails_helper'

feature 'Admin destroy Categories', js: true do
  scenario 'successfully', driver: :webkit do
    category = create(:category)
    admin = create(:admin)
    create(:admin_profile)

    login_as(admin, scope: :admin)

    visit backoffice_category_index_path

    
     click_link t('confirmations.destroy.category')
     click_link t('confirmations.proceed')
     

    expect(page).to have_css('li', text: 'Categoria excluída com sucesso!')
    expect(page).not_to have_css('h3', text: category.description)
    expect(page).not_to have_css('a',
                             text: "Editado em: #{category.updated_at
                                                .strftime('%B %d, %Y')}")
    expect(page).not_to have_css("img[src*='#{category.avatar.file.identifier}']")
    
  end
  
  Capybara.use_default_driver 

end