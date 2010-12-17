# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_clinicaodonto_session',
  :secret      => '14528c07f461eaee939cb2d0bb4efe35a5ee055f4a311e564ef8df1b50990ccc3f3006881751e0f753a4af15950179a7d7b87aa2685052aea9817031231956c3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
