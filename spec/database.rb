$:.unshift(File.dirname(__FILE__) + '/../lib')
$:.unshift(File.dirname(__FILE__) + '/../../rspec/lib')

require 'rubygems'
require 'spec'

puts "Running tests with DataMapper as the ORM."
require 'active_support'
require 'dm-core'
require File.dirname(__FILE__) + '/../init'
DataMapper.logger = Logger.new('/tmp/dj.log')
DataMapper.setup(:default, 'sqlite3::memory:')
class Story
  include DataMapper::Resource
  property :id, Serial
  property :text, Text
  
  def tell; text; end
  def whatever(n, _); tell*n; end

  handle_asynchronously :whatever
end

class SomethingWithStringId
  include DataMapper::Resource
  property :id, String, :key => true
end
DataMapper.auto_migrate!