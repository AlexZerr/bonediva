source "https://rubygems.org"

ruby "1.9.3"

# Rails
gem "rails", "~> 3.2.9"

#e-comerce
gem "activemerchant", '~> 1.38.0'
# Database
gem "activerecord", "~> 3.2.9"
gem "pg"
gem "ajaxful_rating", "~> 3.0.0.beta8"
gem "ancestry",    "~> 1.3.0"
gem "friendly_id", "~> 4.0.9"
gem "kaminari",    "~> 0.14.1"
gem 'paper_trail', '~> 3.0.0'
gem "enum_accessor", "~> 0.2.0"
gem 'omniauth-facebook'
gem 'koala'
group :producton do
  gem "rails_12factor", "~> 0.0.2"
end
# Authentication
gem "devise", "~> 2.2.4"
gem "bcrypt-ruby", "~> 3.0.0"
# Authorization
gem "pundit"

# File Upload
gem "carrierwave", "~> 0.7.0"
gem "fog",         "~> 1.7.0"
gem "mini_magick", "~> 3.4"
#gem "rmagick", "~> 2.13.1"
#gem 'aws-s3', :require => 'aws/s3'
# Friendships
gem "amistad", "~> 0.9.2"

# Monitoring
gem "rpm_contrib",    "~> 2.1.11"

# Activity Logging
gem "audited", github: "effektz/audited", ref: "3f84aa7"

#search

gem "puma", "~> 1.2.1"

#analytics
gem 'piwik_analytics', '~> 1.0.1'

group :assets do
  gem 'bootstrap-sass-rails'
  gem "jquery-rails", "~> 3.1.0"
  gem "therubyrhino"
  gem 'therubyracer'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"  #gem 'twitter-bootstrap-rails' 
  gem "uglifier"
  gem 'sass-rails'
end

gem "letter_opener", :group => :development
group :test, :development do
  gem 'minitest-rails'
  gem "binding_of_caller"
  gem "pry-rails"
  gem "pry-debugger"
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
end
