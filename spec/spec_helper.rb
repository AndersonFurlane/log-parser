require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join 'spec/support/**/*.rb'].each { |f| load f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end