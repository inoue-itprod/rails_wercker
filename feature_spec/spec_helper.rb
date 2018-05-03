require 'capybara/rspec'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'site_prism'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.include Capybara::DSL
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w[headless disable-gpu no-sandbox window-size=1024,768]
      }
    )
  )
end

Capybara.configure do |capybara|
  capybara.app_host = ENV['TARGET_URL']
  capybara.default_driver = :selenium
end

SitePrism.configure do |config|
  # Wait for Ajax.
  config.use_implicit_waits = true
end

Dir[File.join(__dir__, './pages/**/*.rb')].each { |f| require f }
Dir[File.join(__dir__, './support/**/*.rb')].each { |f| require f }
