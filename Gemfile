source 'https://rubygems.org'

gem 'rails', '3.2.16'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'rails_12factor', group: :production
# To use ActiveModel has_secure_password

# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# @author:saasbook
# use Haml for templates
gem 'haml'

# @author:saasbook
# use Ruby debugger
group :development, :test do
	gem 'debugger'
  gem 'rspec-rails'
  gem 'autotest-rails'
end

# To use debugger
# gem 'debugger'

# @author:saasbook
# use omniauth
gem 'omniauth'
gem 'omniauth-twitter'
ruby '2.0.0'
gem 'jasmine'
gem 'themoviedb'

# BDD
group :test do
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end

