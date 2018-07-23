require 'rails_helper'

feature 'Admin see all Categories' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    category = create(:category)
    category2 = create(:category, avatar: Rails
                                          .root
                                          .join('public', 'Nutritionist2.jpg')
                                          .open)

    create(:post, category: category)
    create(:post, category: category)
    create(:post, category: category2)

    login_as(admin, scope: :admin)

    visit backoffice_dashboard_index_path

    click_link('Visualizar Categorias')

    expect(page).to have_current_path(backoffice_categories_path)

    expect(page).to have_css('h3', text: category.description)
    expect(page).to have_css('a', text: "Criado em: #{category
                                                      .created_at
                                                      .strftime('%B %d, %Y')}")
    expect(page).to have_css('a', text: "Posts nesta categoria: #{category
                                                                  .posts
                                                                  .count}")

    expect(page).to have_css("img[src*='#{category.avatar.file.identifier}']")

    expect(page).to have_css('h3', text: category2.description)
    expect(page).to have_css('a', text: "Criado em: #{category2
                                                      .created_at
                                                      .strftime('%B %d, %Y')}")

    expect(page).to have_css('a', text: "Posts nesta categoria: #{category2
                                                                 .posts
                                                                 .count}")

    expect(page).to have_css("img[src*='#{category2.avatar.file.identifier}']")
  end
end
