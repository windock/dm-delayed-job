require File.dirname(__FILE__) + '/dm-delayed-job/message_sending'
require File.dirname(__FILE__) + '/dm-delayed-job/performable_method'
require File.dirname(__FILE__) + '/dm-delayed-job/job'
require File.dirname(__FILE__) + '/dm-delayed-job/worker'

Object.send(:include, Delayed::MessageSending)   
Module.send(:include, Delayed::MessageSending::ClassMethods)

if defined?(Merb::Plugins)
  Merb::Plugins.add_rakefiles File.dirname(__FILE__) / '..' / 'tasks' / 'tasks'
end
