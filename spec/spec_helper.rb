require 'factory_girl'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  coverage_dir './tmp/coverage'
end
SimpleCov.minimum_coverage 90
SimpleCov.minimum_coverage_by_file 90

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  logger = Logger.new('log/phantomjs.log')
  logger.define_singleton_method :puts do |msg|
    logger.info msg
  end
  Capybara::Poltergeist::Driver.new(app, js_errors: true, timeout: 15, debug: true, logger: logger)
end

Capybara.default_max_wait_time = 30
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :chrome if ENV['CHROME']
Capybara.save_path = 'tmp'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Capybara::DSL, type: :feature
  config.include Rails.application.routes.url_helpers

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryGirl::Syntax::Methods
end
