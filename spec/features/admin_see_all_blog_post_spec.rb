require 'rails_helper'

feature 'Admin see all Posts' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:admin_profile)
    create(:category)
    blog = create(:blog)
    blog2 = create(:blog,
                   images: [Rails.root.join('public', 'Nutritionist2.jpg')
                   .open])

    login_as(admin, scope: :admin)

    visit backoffice_blog_dashboard_index_path

    click_link('Visualizar Posts')

    expect(page).to have_current_path(backoffice_blog_index_path)

    expect(page).to have_css('h3', text: blog.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog.body[0..96])
    expect(page).to have_css('a', text: blog.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{blog.images.first.file.identifier}']")

    expect(page).to have_css('h3', text: blog2.title)
    expect(page).to have_css('a', text: blog.admin.admin_profile.name)
    expect(page).to have_css('p', text: blog2.body[0..96])
    expect(page).to have_css('a', text: blog2.created_at.strftime('%B %d, %Y'))
    expect(page).to have_css("img[src*='#{blog2
                                          .images
                                          .first
                                          .file.identifier}']")
  end
end
