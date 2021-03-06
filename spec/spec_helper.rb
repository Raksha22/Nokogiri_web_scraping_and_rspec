require 'simplecov'
require 'webmock/rspec'
require 'vcr_setup'

SimpleCov.start do
  enable_coverage :branch
end

RSpec.configure do |config|

  RSpec::Matchers.define :have_search do |expected|
    match do |actual|
      Nokogiri::HTML(URI.open(actual)).search(expected).any?
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
