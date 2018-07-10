require 'rails_helper'

feature 'Admin destroy Post Posts', js: true do
  scenario 'successfully', driver: :webkit do
    admin = create(:admin)
    create(:admin_profile)
    create(:category)
    post = create(:post)

    login_as(admin, scope: :admin)

    visit  backoffice_posts_path

    click_link t('confirmations.destroy.post')
    click_link t('confirmations.proceed')

    expect(page).to have_css('li', text: 'Postagem excluída com sucesso!')
    expect(page).not_to have_css('h3', text: post.title)
    expect(page).not_to have_css('p', text: post.body[0..96])
    expect(page)
      .not_to have_css('a',
                       text: "Criado em: #{post
                                           .created_at
                                           .strftime('%B %d, %Y')}")
    expect(page)
      .not_to have_css('a',
                       text: "Atualizado em: #{post
                                               .updated_at
                                               .strftime('%B %d, %Y')}")
    expect(page)
      .not_to have_css("img[src*='#{post.images.first.file.identifier}']")
  end

  Capybara.use_default_driver
end
