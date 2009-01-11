module Delayed
  class Job < ActiveRecord::Base    
    set_table_name :delayed_jobs
    
    include Common
  protected
    def before_save
      self.run_at ||= self.class.db_time_now
    end
  end
end
#Place holder for type checking
module DataMapper
  module Resource; end
  module ObjectNotFoundError; end
end