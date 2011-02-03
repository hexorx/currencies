$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'iso4217'

class Currency < ISO4217::Currency
end
