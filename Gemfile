source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Lookbook: for previewing view components in development. Uses action cable and listen for live-auto-update
  gem 'actioncable'
  gem 'listen'
  gem 'lookbook', '>= 2.0.5'

  # Annotate models with schema definitions
  gem 'annotate'

  # Make sure rubocop is running
  # https://ruby-style-guide.shopify.dev
  gem 'rubocop', require: false
  gem 'rubocop-shopify', require: false
end

# Allows managing multiple processes in one terminal, required for running the
# tailwindcss build process at the same time as the rails server.
gem 'foreman', '~> 0.87.2'
gem 'tailwindcss-rails', '~> 2.0'

gem 'view_component', '~> 3.5'