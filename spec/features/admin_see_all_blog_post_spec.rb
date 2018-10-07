require 'rails_helper'

feature 'Admin see all Posts' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile, admin: admin)
    category = create(:category, admin: admin)
    post = create(:post, admin: admin, category: category)
    post2 = create(:post, category: category,
                   admin: admin,
                   images: [Rails.root.join('public', 'Nutritionist2.jpg')
                   .open])

    login_as(admin, scope: :admin)

    visit backoffice_dashboard_index_path

    click_link('Visualizar Posts')

    expect(page).to have_current_path(backoffice_posts_path)

    expect(page).to have_css('h3', text: post.title)
    expect(page).to have_css('a', text: post.admin.admin_profile.name)
    expect(page).to have_css('p', text: post.body[0..96])
    expect(page).to have_css('a', text: post.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{post.images.first.file.identifier}']")
    expect(page).to have_css("img[src*='#{post.images.first.file.identifier}']")

    expect(page).to have_link(t('edit'),
                              href: edit_backoffice_post_path(post.id))
    expect(page).to have_link(t('destroy'), href: backoffice_post_path(post.id))

    expect(page).to have_css('h3', text: post2.title)
    expect(page).to have_css('a', text: post.admin.admin_profile.name)
    expect(page).to have_css('p', text: post2.body[0..96])
    expect(page).to have_css('a', text: post2.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{post2
                                          .images
                                          .first
                                          .file.identifier}']")

    expect(page).to have_link(t('edit'),
                              href: edit_backoffice_post_path(post2.id))
    expect(page).to have_link(t('destroy'), href: backoffice_post_path(post.id))
  end
end
