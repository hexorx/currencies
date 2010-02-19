class Currency
  class << self
    attr_accessor :currencies
    attr_accessor :base_currency
    attr_accessor :import_exchange_rates
  end
  
  attr_reader :code, :symbol, :name, :exchange_currency
  
  def initialize(iso_code,opts={})
    @code = iso_code.to_s.upcase
    @name = opts['name']
    @symbol = opts['symbol']
    @exchange_currency = opts['exchange_currency'] || Currency.base_currency
    @exchange_rate = opts['exchange_rate'].to_f
  end
  
  def exchange_rate
    @exchange_rate = nil unless @exchange_currency == Currency.base_currency
    @exchange_rate ||= load_exchange_rate
  end
  
  def load_exchange_rate
    @exchange_currency = Currency.base_currency
    return 1.0 if @code == @exchange_currency
    if Currency.import_exchange_rates
      http = Net::HTTP.new('download.finance.yahoo.com', 80)
      response = http.get("/d/quotes.csv?e=.csv&f=sl1d1t1&s=#{@code}#{@exchange_currency}=X")
      rate = response.body.split(',')[1]
      rate == '0.0' ? nil : rate.to_f
    else
      nil
    end
  end  
    
  def self.load_file(file)
    YAML.load_file(file).each do |code,options|
      self.add(self.new(code,options))
    end
  end

  def self.from_code(code)
    self.currencies[code.to_s.upcase]
  end
  
  def self.add(new_currency)
    self.currencies ||= {}
    self.currencies[new_currency.code] = new_currency
  end
  
  load_file(File.join(File.dirname(__FILE__), '..', 'data', 'iso4217.yaml'))
  self.base_currency = 'USD'
  self.import_exchange_rates = true
end