source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use mysql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# UI/UX
gem 'enum_help'
gem 'rails-i18n'

# Schema Information
gem 'annotate'

# 環境変数管理
gem 'dotenv-rails'
gem 'config'

# Password Authentication
gem 'sorcery'

# seed
gem 'seed-fu'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # Test
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :development do
  gem 'web-console'

  # Lintチェック
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false

  # Mailer
  gem 'letter_opener_web', '~> 1.0'
end

gem 'cssbundling-rails', '~> 1.1'

gem "dockerfile-rails", ">= 1.2", :group => :development

# 画像アップロード
gem "activestorage", "~> 7.0"
gem 'image_processing', '~> 1.2'

# ページネーション
gem 'kaminari'
gem 'bootstrap5-kaminari-views'

# auto_link
gem 'rinku'

# OGP
gem 'meta_tags'