require 'rails_helper'

feature 'Admin visit backoffice' do
  scenario 'successfully' do
    
    visit backoffice_blog_dashboard_index_path
    
    expect(page).to have_css('h3', text: 'Backoffice Blog Dashboard')
    
  end
end