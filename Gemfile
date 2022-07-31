# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.0.4"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 7.0.3.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.4.1"
# Use Puma as the app server
gem "puma", "~> 5.6"
# Use SCSS for stylesheets
gem "sassc-rails"
# Transpile app-like JavaScript
# Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.4"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.11"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.7"
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

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

# Use Rollbar for exception tracking and logging support
# Read more: https://github.com/rollbar/rollbar-gem
gem "rollbar"

# Rollbar recommended installing this gem
# Read more: https://github.com/ohler55/oj
gem "oj"

# Use this gem for Google Analytis tracking support
# Read more: https://github.com/bgarret/google-analytics-rails
gem "google-analytics-rails", "1.1.1"

# Use Kaminari for pagination support
# Read more: https://github.com/kaminari/kaminari
gem "kaminari"

# Use MetaTags for SEO support
# Read more: https://github.com/kpumuk/meta-tags
gem "meta-tags"

# Use Seedbank for environment specific seed data support
# Read more: https://github.com/james2m/seedbank
gem "seedbank"

# Use New Relic for performance management support
# Read more: https://github.com/newrelic/rpm
gem "newrelic_rpm"

# Use PgHero for PostgreSQL performance dashboard support
# Read more: https://github.com/ankane/pghero
gem "pghero"
gem "pg_query"

# Use Active Admin as the administration framework
# Read more: https://github.com/activeadmin/activeadmin
gem "activeadmin"

# Use Rack::Attack for blocking & throttling abusive requests
# Read more: https://github.com/kickstarter/rack-attack
gem "rack-attack"

group :development, :test do
  # Call 'byebug' anywhere in the code to
  # stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # Use RSpec as the testing framework
  # Read more: https://github.com/rspec/rspec-rails
  gem "rspec_junit_formatter"
  gem "rspec-rails", "~> 5.1"

  # Use Fuubar for improved RSpec formatting
  # Read more: https://github.com/thekompanee/fuubar
  gem "fuubar"

  # Use Factory Bot for test data support
  # Read more: https://github.com/thoughtbot/factory_bot_rails
  gem "factory_bot_rails"

  # Use dotenv to load environment variables in development
  # Read more: https://github.com/bkeepers/dotenv
  gem "dotenv-rails"

  # Use Brakeman for static analysis security vulnerability scanning
  # Read more: https://github.com/presidentbeef/brakeman
  gem "brakeman", require: false

  # Use Bullet for help in reducing the number of queries the app makes
  # Read more: https://github.com/flyerhzm/bullet
  gem "bullet"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"

  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.7"
  gem "rack-mini-profiler", "~> 3.0"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Use RuboCop for static code analysis support
  # Read more: https://github.com/bbatsov/rubocop
  gem "rubocop", require: false

  # Use RuboCop Performance for performance analysis support
  # Read more: https://github.com/rubocop-hq/rubocop-performance
  gem "rubocop-performance"

  # Use RuboCop Rails for Rails code analysis support
  # Read more: https://github.com/rubocop-hq/rubocop-rails
  gem "rubocop-rails"

  # Use RuboCop Rake for Rake-specific code analysis support
  # Read more: https://github.com/rubocop-hq/rubocop-rake
  gem "rubocop-rake"

  # Use RuboCop RSpec for RSpec-specific code analysis support
  # Read more: https://github.com/rubocop-hq/rubocop-rspec
  gem "rubocop-rspec"

  # Use Letter Opener for email previewing support
  # Read more: https://github.com/ryanb/letter_opener
  gem "letter_opener"

  # Use Better Errors for improved error reporting support
  # Read more: https://github.com/charliesome/better_errors
  gem "better_errors"

  # Use this gem to enable advanced features for Better Errors
  # Read more: https://github.com/banister/binding_of_caller
  gem "binding_of_caller"

  # Use Pry as a replacement for IRB
  # Read more: https://github.com/rweng/pry-rails
  gem "pry-rails"

  # Use Overcommit to manage and configure Git hooks
  # Read more: https://github.com/brigade/overcommit
  gem "overcommit"

  # Use Localhost to support SSL locally
  # Read more: https://github.com/socketry/localhost
  gem "localhost"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"

  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"

  # Use SimpleCov for code coverage analysis
  # Read more: https://github.com/colszowka/simplecov
  gem "simplecov", require: false

  # Use Codecov for code coverage reports
  # Read more: https://github.com/codecov/codecov-ruby
  gem "codecov", require: false

  # Use Timecop for making it simple to test time-dependent code
  # Read more: https://github.com/travisjeffery/timecop
  gem "timecop"
end

group :production do
  # Use Lograge for improved logs
  # Read more: https://github.com/roidrage/lograge
  gem "lograge"

  # Use this gem so that request.remote_ip works as expected
  # Read more: https://github.com/customink/actionpack-cloudflare
  gem "actionpack-cloudflare"

  # Use Coverband to measure production code usage
  # Read more: https://github.com/danmayer/coverband
  gem "coverband"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
