source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Tether for tooltips and popovers positioning
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

# Use Bootstrap as the front-end framework
gem 'bootstrap', '~> 4.0.0.alpha6'

# Use Font Awesome for icons support
gem "font-awesome-rails"

# Use Devise for user authentication support
gem 'devise'
gem 'devise-bootstrap-views', github: 'hisea/devise-bootstrap-views', branch: 'bootstrap4'

# Use FriendlyId for pretty URLs support
gem 'friendly_id', '~> 5.1.0'

# Use Rolify for user role management support
gem "rolify"

# Use CanCanCan for user authorization support
gem 'cancancan'

# Use Country Select for country selection support
gem 'country_select'

# Use flag-icon-css for country flags support
gem 'flag-icons-rails'

# Use Gravtastic to add user profile images through Gravatar
# Read more: https://github.com/chrislloyd/gravtastic
gem 'gravtastic'

# Use this gem for reCAPTCHA support
# Read more: https://github.com/ambethia/recaptcha
gem "recaptcha", require: "recaptcha/rails"

# Use Rollbar for exception tracking and logging support
# Read more: https://github.com/rollbar/rollbar-gem
gem 'rollbar'

# Use Oj for optimized JSON support
# Rollbar recommended installing this gem
# Read more: https://github.com/ohler55/oj
gem 'oj'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Use RSpec as the testing framework
  gem 'rspec-rails', '~> 3.5'

  # Use Capybara to simulate how a real user would interact with the app
  gem 'capybara'

  # Use Factory Girl for test data support
  gem 'factory_girl_rails'

  # Use dotenv to load environment variables in development
  # Read more: https://github.com/bkeepers/dotenv
  gem 'dotenv-rails'

  # Use Brakeman for static analysis security vulnerability scanning
  # Read more: https://github.com/presidentbeef/brakeman
  gem 'brakeman', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Use Rubocop for static code analysis support
  gem 'rubocop', require: false

  # Use Letter Opener for email previewing support
  gem "letter_opener"

  # Use Better Errors for improved error reporting support
  gem "better_errors"
  gem "binding_of_caller"

  # Use Bullet for help in reducing the number of queries the app makes
  # Read more: https://github.com/flyerhzm/bullet
  gem 'bullet'


  gem 'rails_real_favicon'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
