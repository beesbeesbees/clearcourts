set :stage, :staging
set :branch, :staging
set :deploy_to, '/home/rails/rails_project'

server '45.55.21.245', user: 'rails', roles: %w{app web db}
