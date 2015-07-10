require_relative 'boot'
require_relative '../db/db'

Bundler.require :default, ENV['RACK_ENV']

# Require Roar modules.
require 'roar/representer'
require 'roar/json'
require 'roar/json/hal'

# Load ROM setup.
DB.setup

# Add delete as a canable action.
Canable.add(:delete, :deletable)

# Set Stripe API key.
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

require_rel '../app'
require_rel '../api'
