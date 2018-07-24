require 'rails_helper'

feature 'Admin Edit category', js: true do
  scenario 'successfully', driver: :webkit do
    admin = create(:admin)
    create(:admin_profile)
    description = Faker::Dessert.variety
    description2 = Faker::Dessert.topping
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..5)}.jpg")

    category = create(:category, description: description)

    login_as(admin, scope: :admin)
    visit backoffice_categories_path

    click_link('Editar Categoria')

    fill_in 'Descrição', with: description2
    attach_file image
    click_button('Editar')

    expect(page).to have_current_path(backoffice_categories_path)

    expect(page).to have_css('h3', text: description2)
    expect(page).to have_css('a',
                             text: "Atualizado em: #{category.updated_at
                                                .strftime('%B %d, %Y')}")
    expect(page).to have_css("img[src*='#{File.basename(image)}']")

    expect(page).not_to have_css('h3', text: description)

    expect(page)
      .not_to have_css("img[src*='#{File
                                    .basename(category
                                              .avatar.file.identifier)}']")
  end

  Capybara.use_default_driver
end
