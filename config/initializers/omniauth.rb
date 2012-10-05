Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['UrkKjYgZRhsYTGPQGozPhA'], ENV['FlQHJija2i5bUi24sOsz3BBPS1LXRFaT8BLZAfoO8']
end