# Load the rails application
require File.expand_path('../application', __FILE__)

config.gem "activemerchant", :lib => "active_merchant", :version => "1.4.1"

# Initialize the rails application
Bonediva::Application.initialize!

