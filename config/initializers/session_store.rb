# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_helpme_session',
  :secret      => 'f9d811831cefd87b77c9441f6eb879192c8c99c1c528a6df2679cf60866e11f9b3cf707911f32b550d14aeddca3dd665a44b0fc37307b57e80d435fb0b4c14e6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
