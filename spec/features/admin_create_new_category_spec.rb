require 'rails_helper'

feature 'Admin create new category' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    description = Faker::Dessert.variety
    image = Rails.root.join('spec',
                            'resources',
                            'images',
                            'category',
                            "#{Random.rand(1..3)}.jpg")

    image2 = Rails.root.join('spec',
                             'resources',
                             'images',
                             'category',
                             "#{Random.rand(1..3)}.jpg")

    category = create(:category, cover: image2)
    create(:post, category: category)

    login_as(admin, scope: :admin)
    visit backoffice_dashboard_index_path

    click_link('Nova Categoria')

    fill_in 'Descrição', with: description
    attach_file image
    click_button('Criar')

    expect(page).to have_current_path(backoffice_categories_path)

    expect(page).to have_css('h3', text: description)
    expect(page).to have_css('a', text: "Criado em: #{Time.zone.now
                                                      .strftime('%B %d, %Y')}")
    expect(page).to have_css('a', text: 'Posts nesta categoria: 0')
    expect(page).to have_css("img[src*='#{File.basename(image)}']")

    expect(page).to have_css('h3', text: category.description)
    expect(page).to have_css('a',
                             text: "Criado em: #{category
                                                 .created_at
                                                 .strftime('%B %d, %Y')}")
    expect(page).to have_css('a',
                             text: "Posts nesta categoria: #{category
                                                             .posts.count}")
    expect(page).to have_css("img[src*='#{File.basename(image2)}']")
  end
end
