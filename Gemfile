source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "4.2.6"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails"
gem "foundation-icons-sass-rails"
gem "foundation-rails", "~> 5.5.2.1"
gem "jquery-rails"
gem "sass-rails", "~> 5.0.3"
gem "skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to"
gem "metamagic"
gem "simple_form"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise", "~> 3.5.4"
gem "draper"
gem "flamegraph"
gem "google-analytics-rails"
gem "health_check"
gem "interactor"
gem "kaminari"
gem "memory_profiler"
gem "puma"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false
gem "refile", require: "refile/rails", git: "https://github.com/refile/refile"
gem "refile-mini_magick"
gem "refile-s3"
gem "responders"
gem "rollbar"
gem "seedbank"
gem "stackprof"
gem "fog"
gem "fragments.js", git: "https://github.com/fs/fragments.js"

group :staging, :production do
  gem "newrelic_rpm"
  gem "rails_stdout_logging"
end

group :test do
  gem "capybara", ">= 2.5.0"
  gem "capybara-webkit", ">= 1.7.0"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "rspec-its"
  gem "shoulda-matchers"
  gem "webmock", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices", require: false
  gem "rspec-rails", "~> 3.4"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "bullet"
  gem "foreman", require: false
  gem "letter_opener"
  gem "quiet_assets"
  gem "rails-erd"
  gem "slim-rails"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console", "~> 2.0"
end
