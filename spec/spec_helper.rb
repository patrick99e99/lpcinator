require 'pry'
require 'rspec'
require_relative '../lpcinator'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :progress
end
