source 'https://rubygems.org'
ruby '2.2.3'
gem 'rails', '~> 4.2.4' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'mysql2', '~> 0.3.20' # use MySQL for the db

gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views
# gem 'therubyracer', platforms: :ruby # See https://github.com/rails/execjs#readme for more supported runtimes
gem 'jquery-rails', '~> 4.0.5' # Use jquery as the JavaScript library
# gem 'turbolinks' # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0', group: :doc # bundle exec rake doc:rails generates the API under doc/api.
# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password

gem 'unicorn', '~> 4.9.0' # Use Unicorn as the app server
gem 'dotenv', '~> 2.0.2' # pull credentials from the machine currently running

gem 'factory-helper', '~> 1.7.3' # generate fake data

group :development, :test do
  # gem 'byebug' # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'better_errors'
end

group :development do
  gem 'capistrano-rails', '~> 1.1.3' # Use Capistrano for deployment
  gem 'rvm1-capistrano3', '~> 1.3.2.2', require: false # capistrano & rvm integration
  gem 'capistrano3-unicorn', '~> 0.2.1' # capistrano & unicorn integration
  gem 'capistrano-sidekiq', '~> 0.5.3'

  gem 'annotate', '~> 2.6.10'
end

gem 'autoprefixer-rails', '~> 4.0.2.2'
gem 'sidekiq', '~> 3.5.0'
gem 'sinatra', '~> 1.4.6'
gem 'twilio-ruby', '~> 4.3.0'


gem 'font-awesome-sass', '~> 4.2.2'


source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-bootswatch'
  gem "rails-assets-jquery-ui"
end

gem 'devise', '~> 3.5.1'
gem 'devise_invitable', '~> 1.5.1'

gem 'active_model_serializers', '~> 0.9.3'
gem 'will_paginate', '~> 3.0.7'
gem 'has_secure_token', '~> 1.0.0'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
