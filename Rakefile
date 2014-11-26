['.', 'lib', 'tasks'].each do |dir|
  $:.push File.expand_path dir
end

Dir.glob('tasks/*').each do |file|
  load file
end

require 'optparse'
require 'pry'
require 'rspec/core/rake_task'
require 'spec/spec_helper'
require 'lpcinator'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

