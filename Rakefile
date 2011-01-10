require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "currencies"
    gem.summary = %Q{Simple gem for working with currencies. It is extracted from the countries gem and contains all the currency information in the ISO 4217 standard.}
    gem.description = %Q{If you are tracking any kind of assets the currencies gem is for you. It contains every currency in the ISO 4217 standard and allows you to add your own as well. So if you decide to take sparkly buttons as a form of payment you can use currencies to display the shiny button unicode symbol ☼ (disclaimer: ☼ may not look like a shiny button to everyone.) when used with something like the money gem. Speaking of the money gem, currencies gives you an ExchangeBank that the money gem can use to convert from one currency to another. There are plans to have ExchangeRate provider plugin system. Right now the rates are either set manually or pulled from Yahoo Finance.}
    gem.email = "hexorx@gmail.com"
    gem.homepage = "http://github.com/hexorx/currencies"
    gem.authors = ["hexorx"]
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "yard"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
