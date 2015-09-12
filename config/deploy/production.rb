set :stage, :production
set :branch, :production
set :deploy_to, '/home/rails/rails_project'

server '107.170.234.136', user: 'rails', roles: %w{app web db}
