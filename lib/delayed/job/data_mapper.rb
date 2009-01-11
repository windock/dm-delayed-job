module Delayed
  class Job
    include DataMapper::Resource
    
    storage_names[:default]='delayed_jobs'
    
    property :id, Serial
    property :priority, Integer, :default => 0
    property :attempts, Integer, :default => 0
    property :handler, Text
    property :last_error, String
    property :run_at, Time
    property :locked_at, Time
    property :locked_by, String
    property :failed_at, Time
    timestamps(:at)
    
    def self.update_all(with, from)
      repository(:default).adapter.execute("UPDATE #{storage_names[:default]} SET #{with[0]} WHERE #{from[0]}", *with[1..-1].concat(from[1..-1])).affected_rows
    end
    
    def self.delete_all
      all.destroy!
    end
    
    def self.last
      all.last
    end
    
    def logger
      DataMapper.logger
    end
    
    def self.logger
      DataMapper.logger
    end

    before(:save) { self.run_at ||= self.class.db_time_now }
    
    include Common
  end
end

#Place holder for type checking
module ActiveRecord
  module Base
    def self.default_timezone
      :boo
    end
  end
  module RecordNotFound; end
end