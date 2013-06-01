source "https://rubygems.org"

ruby "1.9.3", engine: "jruby", engine_version: "1.7.1"

# Rails
gem "rails", "~> 3.2.9"
gem "strong_parameters", "~> 0.1.5"

#e-comerce
gem "activemerchant"
# Database
gem "activerecord-jdbcpostgresql-adapter", "~> 1.2.2"
gem "ajaxful_rating", "~> 3.0.0.beta8"
gem "ancestry",    "~> 1.3.0"
gem "friendly_id", "~> 4.0.9"
gem "kaminari",    "~> 0.14.1"
gem "rails3_acts_as_paranoid", "~> 0.2.4"
gem "enum_accessor", "~> 0.2.0"

# Authentication
gem "devise", "~> 2.1.2"
gem "bcrypt-ruby", :require => "bcrypt"
# Authorization
gem "pundit", "~> 0.1.0"

# File Upload
gem "carrierwave", "~> 0.7.1"
gem "fog",         "~> 1.8.0"
gem "mini_magick", "~> 3.4"
#gem "rmagick", "~> 2.13.1"
#gem 'aws-s3', :require => 'aws/s3'
# Friendships
gem "amistad", "~> 0.9.2"

# Monitoring
gem "newrelic-redis", "~> 1.4.0"
gem "newrelic_rpm",   "~> 3.5"
gem "rpm_contrib",    "~> 2.1.11"

# Activity Logging
gem "audited", github: "effektz/audited", ref: "3f84aa7"
gem "audited-activerecord", "~> 3.0.0"

gem "puma", "~> 1.6.3"

group :assets do
  gem 'bootstrap-sass-rails'
  gem "jquery-rails",            "~> 2.1.3"
  gem "therubyrhino"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"  #gem 'twitter-bootstrap-rails' 
end

group :test, :development do
  gem 'minitest-rails'
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem "capybara"
end
