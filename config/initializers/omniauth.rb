Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['UrkKjYgZRhsYTGPQGozPhA'], ENV['FlQHJija2i5bUi24sOsz3BBPS1LXRFaT8BLZAfoO8']
  provider :facebook, ENV['265463363556262'], ENV['66a40bf16b9125c211e63c33adb2442e']
  
  OmniAuth.config.logger = Rails.logger
end