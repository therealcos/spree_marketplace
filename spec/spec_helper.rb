require 'coveralls'
Coveralls.wear!

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)

require 'rspec/rails'
require 'database_cleaner'
require 'ffaker'
require 'shoulda-matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/capybara_ext'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/factories'
require 'spree/testing_support/preferences'
require 'spree/testing_support/url_helpers'
require 'spree_drop_ship/factories'

# Requires factories defined in lib/spree_marketplace/factories.rb
require 'spree_marketplace/factories'

require 'vcr'
VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'tmp/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.ignore_localhost = true
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include IntegrationHelpers
  config.include Spree::TestingSupport::Preferences
  config.include Spree::TestingSupport::UrlHelpers

  config.backtrace_clean_patterns = []
  config.color = true
  config.infer_spec_type_from_file_location!
  config.mock_with :rspec
  # Capybara javascript drivers require transactional fixtures set to false, and we use DatabaseCleaner
  # to cleanup after each test instead.  Without transactional fixtures set to false the records created
  # to setup a test will be unavailable to the browser, which runs under a seperate server instance.
  config.use_transactional_fixtures = false

  # Ensure Suite is set to use transactions for speed.
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  # Before each spec check if it is a Javascript test and switch between using database transactions or not where necessary.
  config.before :each do
    DatabaseCleaner.strategy = RSpec.current_example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
    reset_spree_preferences
    # Set some configuration defaults.
    ActionMailer::Base.default_url_options[:host] = 'localhost'
  end

  # After each spec clean the database.
  config.after :each do
    DatabaseCleaner.clean
  end

  # Add VCR to all tests.
  config.around :each do |example|
    vcr_options = example.metadata[:vcr] || { :re_record_interval => 7.days }
    if vcr_options[:record] == :skip
      VCR.turned_off(&example)
    else
      test_name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
      VCR.use_cassette(test_name, vcr_options, &example)
    end
  end

  config.fail_fast = ENV['FAIL_FAST'] || false
end
