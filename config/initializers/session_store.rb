# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_snippets_session',
  :secret      => 'be1cccaca1c51bb25f77274b8563513abc51163d3d23fdd232cc523d2a7e306d4a2611b99403240224abc74b8c71e0d4619ac7a91f4d1aea7806f28e4f794650'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
