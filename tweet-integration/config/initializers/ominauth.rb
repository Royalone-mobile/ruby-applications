require "constants"
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER_APP_ID, TWITTER_SECRET
end