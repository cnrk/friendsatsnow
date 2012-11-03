source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'activeadmin'
gem 'rack', '1.3.3' # 1.3.4 spits out strange warnings.. 
gem 'thin'

gem 'sass-rails',   '~> 3.1.4'

 group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass', '>= 0.12.alpha.0'
end

group :production do
  gem 'pg'

end

group :development, :test do
  gem 'mysql2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
