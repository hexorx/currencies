require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Currency do
  before(:all) do
    @usd = Currency.from_code(:USD)
    @gbp = Currency.from_code(:GBP)
  end
  
  it 'should return code' do
    @usd.code.should == 'USD'
    @gbp.code.should == 'GBP'
  end
  
  it 'should return symbol' do
    @usd.symbol.should == '$'
    @gbp.symbol.should == '£'
  end
  
  it 'should return name' do
    @usd.name.should == 'Dollars'
    @gbp.name.should == 'Pounds'
  end
  
  describe 'from_code' do
    it 'should return new Currency instance when passed iso4217 currency code' do
      Currency.from_code('USD').should be_a(Currency)
    end
    
    it 'should return a currency with the same code' do
      Currency.from_code('USD').code.should == 'USD'
      Currency.from_code('GBP').code.should == 'GBP'
    end
    
    it 'should accept symbol' do
      Currency.from_code(:USD).code.should == 'USD'
      Currency.from_code(:GBP).code.should == 'GBP'
    end
    
    it 'should work with lower case' do
      Currency.from_code('usd').code.should == 'USD'
      Currency.from_code('gbp').code.should == 'GBP'
    end
  end
  
  describe 'exchange_rate' do
    it 'should return a float' do
      Currency.from_code('GBP').exchange_rate.should be_a(Float)
      puts Currency.from_code('GBP').exchange_rate
    end
    
    it 'should have an exchange rate of 1.0 for the base currency' do
      Currency.from_code(Currency.base_currency).exchange_rate.should == 1.0
    end
  end
end