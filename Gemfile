source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "active_model_serializers", "~> 0.10.13"

# API Doc generator
gem "apipie-rails", "~> 1.2", ">= 1.2.2"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# elasticsearch
gem "elasticsearch-rails", "~> 7.2", "= 7.2.1"
gem 'elasticsearch-model', "~> 7.2", ">= 7.2.1"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

gem "mongoid", "~> 8.1", ">= 8.1.1"

# Pagination
gem "pagy", "~> 6.0", ">= 6.0.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8"

# scheduler
gem "rufus-scheduler", "~> 3.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
group :development, :test do
  gem "byebug", "~> 11.1", ">= 11.1.3"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "dotenv-rails"
  gem "factory_bot_rails", "~> 6.2"
  gem "ffaker", "~> 2.21"
  gem "rspec-rails", "~> 6.0", ">= 6.0.3"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  gem "mongoid-rspec", "~> 4.1"
  gem "shoulda-matchers", "~> 5.3"
end
