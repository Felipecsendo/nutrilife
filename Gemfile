source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Repository for collecting Locale data for Ruby on Rails I18n
# as well as other interesting, Rails related I18n stuff
gem 'rails-i18n'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Translations for devise gem
gem 'devise-i18n'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form'
# Bootstrap
gem 'rails-assets-bootstrap', '3.3.7', source: 'https://rails-assets.org'
# Font-Awesome SASS gem for use in Ruby on Rails projects
gem 'font-awesome-sass'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Rails gem of the Bootstrap based admin theme SB Admin 2.
gem 'bootstrap_sb_admin_base_v2'
# Confirm dialogs using Twitter Bootstrap
gem 'twitter-bootstrap-rails-confirm'
# Audited (formerly acts_as_audited) is an ORM extension that logs all changes to your Rails models.
gem "audited", "~> 4.7"
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave', '~> 1.0'
# MiniMagick
gem 'mini_magick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'capybara-webkit', git: 'https://github.com/thoughtbot/capybara-webkit.git', branch: 'master'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'simplecov', require: false
  # Manage Procfile-based applications
  gem 'foreman'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  # O Lero-lero Generator é uma ferramenta capaz de gerar frases que 'falam' muita coisa mas que não tem conteúdo algum.
  gem 'lerolero_generator'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
