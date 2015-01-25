require 'ruby-audio'
require 'bufferable' 

Dir.glob('lib/*.rb').each do |file|
  require file.split(/\/([^.]+)\./)[1]
end
