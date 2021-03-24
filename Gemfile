source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
 gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Elastic Seearch 
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
# Faker dummy info
gem 'faker', '~> 2.17'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Random tokens 
gem 'random_token', '~> 1.1', '>= 1.1.1'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # RSPEC
  # gem 'rspec'
  # gem 'rspec-rails'
end

group :development do
end

group :test do
  # Clean Database between tests
  # gem 'database_cleaner'
  # # Programmatically start and stop ES for tests
  # gem 'elasticsearch-extensions'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
