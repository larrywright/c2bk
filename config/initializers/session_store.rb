# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_c2bk_session',
  :secret      => '5a649cafe208f530d98e4e2d90391103b2a777df301aee70df747b1c022ca213608357f9e27e4a735576be7b623a5b5ac2956fe9e930544688578c8d70f63deb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
