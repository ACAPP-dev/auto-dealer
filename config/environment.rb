# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Generate Random Password for Facebook Login
require 'securerandom'

# Require active model for custom validations
require 'active_model'
