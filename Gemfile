# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.4.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.2"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.18"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Bootstrap as the front-end framework
# Read more: https://github.com/twbs/bootstrap-rubygem
gem "bootstrap", "~> 4.0.0.beta2.1"

# Use Devise for user authentication support
# Read more: https://github.com/plataformatec/devise
gem "devise"

# Use FriendlyId for pretty URLs support
# Read more: https://github.com/norman/friendly_id
gem "friendly_id"

# Use Country Select for country selection support
# Read more: https://github.com/stefanpenner/country_select
gem "country_select"

# Use Gravtastic to add user profile images through Gravatar
# Read more: https://github.com/chrislloyd/gravtastic
gem "gravtastic"

# Use this gem for reCAPTCHA support
# Read more: https://github.com/ambethia/recaptcha
gem "recaptcha", require: "recaptcha/rails"

# Use Rollbar for exception tracking and logging support
# Read more: https://github.com/rollbar/rollbar-gem
gem "rollbar"

# Rollbar recommended installing this gem
# Read more: https://github.com/ohler55/oj
gem "oj"

# Use this gem for Google Analytis tracking support
# Read more: https://github.com/bgarret/google-analytics-rails
gem "google-analytics-rails", "1.1.1"

# Use Chartkick for charts support
# Read more: https://github.com/ankane/chartkick
gem "chartkick"

# Use Kaminari for pagination support
# Read more: https://github.com/kaminari/kaminari
gem "kaminari"

# Use MetaTags for SEO support
# Read more: https://github.com/kpumuk/meta-tags
gem "meta-tags"

# Use Roboto for environment specific robots.txt support
# Read more: https://github.com/LaunchAcademy/roboto
gem "roboto"

# Use Seedbank for environment specific seed data support
# Read more: https://github.com/james2m/seedbank
gem "seedbank"

# Use New Relic for performance management support
# Read more: https://github.com/newrelic/rpm
gem "newrelic_rpm"

# Use PgHero for PostgreSQL performance dashboard support
# Read more: https://github.com/ankane/pghero
gem "pg_query"
gem "pghero"

# Use Active Admin as the administration framework
# Read more: https://github.com/activeadmin/activeadmin
gem "activeadmin"

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem "byebug", platform: :mri

  # Use RSpec as the testing framework
  # Read more: https://github.com/rspec/rspec-rails
  gem "rspec-rails", "~> 3.5"
  gem "rspec_junit_formatter"

  # Use Capybara to simulate how a real user would interact with the app
  # Read more: https://github.com/teamcapybara/capybara
  gem "capybara"
  gem "chromedriver-helper"
  gem "selenium-webdriver"

  # Use Factory Bot for test data support
  # Read more: https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails"

  # Use dotenv to load environment variables in development
  # Read more: https://github.com/bkeepers/dotenv
  gem "dotenv-rails"

  # Use Brakeman for static analysis security vulnerability scanning
  # Read more: https://github.com/presidentbeef/brakeman
  gem "brakeman", require: false

  # Use image_optim to optimize images
  # Read more: https://github.com/toy/image_optim
  gem "image_optim"
  gem "image_optim_pack"

  # Use Bullet for help in reducing the number of queries the app makes
  # Read more: https://github.com/flyerhzm/bullet
  gem "bullet"
end

group :development do
  # Access an IRB console on exception pages or
  # by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"

  # Spring speeds up development by keeping your
  # application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # Use Rubocop for static code analysis support
  # Read more: https://github.com/bbatsov/rubocop
  gem "rubocop", require: false

  # Use Letter Opener for email previewing support
  # Read more: https://github.com/ryanb/letter_opener
  gem "letter_opener"

  # Use Better Errors for improved error reporting support
  # Read more: https://github.com/charliesome/better_errors
  gem "better_errors"

  # Use this gem to enable advanced features for Better Errors
  # Read more: https://github.com/banister/binding_of_caller
  gem "binding_of_caller"

  # Use this gem to generate favicons for multiple devices
  # Read more: https://github.com/RealFaviconGenerator/rails_real_favicon
  gem "rails_real_favicon"

  # Use Pry as a replacement for IRB
  # Read more: https://github.com/rweng/pry-rails
  gem "pry-rails"

  # Use Overcommit to manage and configure Git hooks
  # Read more: https://github.com/brigade/overcommit
  gem "overcommit"

  # Use RubyCritic for static code analysis reports
  # Read more: https://github.com/whitesmith/rubycritic
  gem "rubycritic", require: false
end

group :test do
  # Use SimpleCov for code coverage analysis
  # Read more: https://github.com/colszowka/simplecov
  gem "simplecov", require: false
end

group :staging, :production do
  # Use Lograge for improved logs
  # Read more: https://github.com/roidrage/lograge
  gem "lograge"

  # Use this gem so that request.ip and request.remote_ip both work as expected
  # Read more: https://github.com/modosc/cloudflare-rails
  gem "cloudflare-rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
