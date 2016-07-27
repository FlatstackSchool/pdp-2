Capybara.configure do |config|
  config.match = :prefer_exact
  config.javascript_driver = :webkit
  config.asset_host = "http://#{ENV.fetch('HOST_WITH_PORT')}"
  config.default_host = "http://#{ENV.fetch('HOST')}"
end
