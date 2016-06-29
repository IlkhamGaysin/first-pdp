ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"
require "webmock/rspec"

# Run codeclimate-test-reporter only in CI
if ENV["CI"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

WebMock.disable_net_connect!(allow_localhost: true, allow: %w(codeclimate.com))

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
end
