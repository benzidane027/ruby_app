source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'active_storage_validations'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootsnap', require: false
gem 'jwt'
gem 'rack-cors', require: 'rack/cors'
gem 'shoulda-matchers', require: false

gem 'validates_email_format_of'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
gem 'kt-paperclip', '~> 6.4', '>= 6.4.1'
gem 'responders'

gem 'mini_magick'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'activeadmin'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'devise'
  gem 'jaro_winkler', '~> 1.6.0'
  gem 'rufo'
  gem 'solargraph', '~> 0.50.0'
  gem 'sprockets-rails'
end

gem 'aws-sdk-s3'
gem 'dotenv-rails'
gem 'sidekiq', '~> 7.1'

# make sure to excute this command
##################################

#   for ubuntu

# sudo apt install libvips
# sudo apt install libpq-dev
# sudo apt-get install libmagickwand-dev
# sudo apt-get install imagemagick

#   for fedora
# sudo dnf install libpq-devel
# sudo dnf install vips-devel
# sudo dnf install mageMagick-devel
