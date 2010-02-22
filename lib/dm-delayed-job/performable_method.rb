module Delayed
  class PerformableMethod < Struct.new(:object, :method, :args)
    CLASS_STRING_FORMAT = /^CLASS\:([A-Z][\w\:]+)$/
    DM_STRING_FORMAT    = /^DM\:([A-Z][\w\:]+)\:(.*)$/

    def initialize(object, method, args)
      raise NoMethodError, "undefined method `#{method}' for #{self.inspect}" unless object.respond_to?(method)

      self.object = dump(object)
      self.args   = args.map { |a| dump(a) }
      self.method = method.to_sym
    end
    
    def display_name  
      case self.object
      when CLASS_STRING_FORMAT then "#{$1}.#{method}"
      when DM_STRING_FORMAT then "#{$1}##{method}"
      else "Unknown##{method}"
      end      
    end    

    def perform
      load(object).send(method, *args.map{|a| load(a)})
    rescue DataMapper::ObjectNotFoundError
      # We cannot do anything about objects which were deleted in the meantime
      true
    end

    private

    def load(arg)
      case arg
      when CLASS_STRING_FORMAT then $1.constantize
      when DM_STRING_FORMAT then $1.constantize.get!($2) 
      else arg
      end
    end

    def dump(arg)
      case arg
      when Class              then class_to_string(arg)
      when DataMapper::Resource then dm_to_string(arg)
      else arg
      end
    end

    def dm_to_string(obj)
      "DM:#{obj.class}:#{obj.id}"
    end

    def class_to_string(obj)
      "CLASS:#{obj.name}"
    end
  end
end
