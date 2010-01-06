# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_evokeapp_session',
  :secret      => '3b6be5e4475b22bfbd677b5c360b99e48f73fb0e04c5d356b73e02200c9bcafb86c4fedb1965843706c6254ca9ddac868e0d3bab5261c5082e2f0454edd505b8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
