require 'ruby-audio'
require 'bufferable' 

Dir.glob('lib/*.rb').each do |file|
  load file
end
