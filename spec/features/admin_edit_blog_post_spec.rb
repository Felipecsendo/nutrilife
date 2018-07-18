require 'rails_helper'

feature 'Admin edit Post Post' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    create(:category)
    category2 = create(:category)
    post = create(:post)

    title = Faker::Food.dish
    body = Faker::Food.description
    image = Rails.root.join('public',
                            'templates',
                            'yummy',
                            'img',
                            'blog-img',
                            "#{Random.rand(1..16)}.jpg")

    login_as(admin, scope: :admin)

    visit backoffice_posts_path

    click_link('Editar Postagem')

    fill_in 'Título', with: title
    fill_in 'Conteúdo', with: body
    select(category2.description, from: 'Categoria')
    attach_file image
    click_button('Editar')

    expect(page).to have_css('li', text: 'Postagem editada com sucesso!')
    expect(page).to have_css('h3', text: title)
    expect(page).to have_css('a', text: admin.admin_profile.name)
    expect(page).to have_css('p', text: body[0..96])
    expect(page)
      .to have_css('a',
                   text: "#{t('created_at')}: #{post
                                                .created_at
                                                .strftime('%B %d, %Y')}")
    expect(page)
      .to have_css('a',
                   text: "#{t('updated_at')}: #{post
                                                .updated_at
                                                .strftime('%B %d, %Y')}")
    expect(page).to have_css("img[src*='#{File.basename(image)}']")
  end
end
