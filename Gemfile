source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'activeadmin'
gem 'rack', '1.3.3' # 1.3.4 spits out strange warnings..
gem 'sass-rails',   '~> 3.1.4'
gem 'coffee-rails', '~> 3.1.1'

 group :assets do
  gem 'uglifier', '>= 1.0.3'
  gem 'compass', '>= 0.12.alpha.0'
end

group :production do
  gem 'pg'
  gem 'thin'
end

group :development, :test do
  gem 'mysql2'
end
