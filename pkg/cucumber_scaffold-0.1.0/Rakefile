require 'rubygems'  
require 'rake'  
require 'echoe'  
  
Echoe.new('cucumber_scaffold', '0.1.0') do |p|  
  p.description     = "Generate scaffolding for Cucumber features and steps definitions"  
  p.url             = "http://github.com/andyw8/cucumber_scaffold"  
  p.author          = "Andy Waite"  
  p.email           = "andy@andywaite.com"
  p.development_dependencies = []  
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }