source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "carrierwave", "~> 2.1"
gem "faker"
gem "font-awesome-rails" 
gem "hirb"
gem "jbuilder", "~> 2.7"
gem "omniauth-facebook"
gem "pg"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.3", ">= 6.0.3.1"
gem "rails-erd"
gem "redis"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-callback-matchers"
  gem "shoulda-matchers"
  gem "simplecov"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
