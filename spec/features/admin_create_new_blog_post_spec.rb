require 'rails_helper'

feature 'Admin create new blog post' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    category = create(:category)
    title = Faker::Dessert.variety
    body = LeroleroGenerator.sentence(3)
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..16)}.jpg")

    login_as(admin, scope: :admin)
    visit backoffice_blog_dashboard_index_path

    click_link('Novo Post')

    fill_in 'Título', with: title
    fill_in 'Conteúdo', with: body
    select(category.description, from: 'Categoria')
    attach_file image
    click_button('Criar')

    expect(page).to have_current_path( backoffice_posts_path)

    expect(page).to have_css('h3', text: title)
    expect(page).to have_css('a', text: admin.admin_profile.name)
    expect(page).to have_css('p', text: body[0..96])
    expect(page).to have_css('a', text: Time.zone.now.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{File.basename(image)}']")
  end

  scenario 'but fields are blank' do
    admin = create(:admin)
    create(:admin_profile)
    create(:category)

    login_as(admin, scope: :admin)

    visit new_backoffice_post_path

    click_button t('create')

    expect(page).to have_css('li', text: 'Título não pode ficar em branco')
    expect(page).to have_css('li', text: 'Conteúdo não pode ficar em branco')
  end
end
