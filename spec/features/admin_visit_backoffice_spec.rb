require 'rails_helper'

feature 'Admin visit backoffice' do
  scenario 'successfully' do
    
    visit backoffice_blog_dashboard_index_path
    
    expect(page).to have_css('h3', text: 'Backoffice Blog Dashboard')
    expect(page).to have_css('div.navbar-header a.navbar-brand', text: 'Administração Nutrilife')
    
  end
  
  scenario 'and see Navigation Topbar' do
    
    visit backoffice_blog_dashboard_index_path
    
    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-bell.fa-fw')
    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-caret-down', count: 2)
    expect(page).to have_css('ul.nav.navbar-top-links.navbar-right i.fa.fa-user.fa-fw')
  
  end
  
  scenario 'and see Navigation Sidebar' do
    
    visit backoffice_blog_dashboard_index_path
  
    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Dashboard')
    expect(page).to have_css('ul.nav.nav-primary-level li a', text: 'Blog')
    expect(page).to have_css('ul.nav.nav-second-level li a', text: 'Novo Post')
    expect(page).to have_css('ul.nav.nav-second-level li a', text: 'Visualizar Posts')
  
  end
end