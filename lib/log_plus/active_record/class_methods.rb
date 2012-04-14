module LogPlus
  module ActiveRecord
    def self.included base
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_log_plus options = {}
        self.send :include, InstanceMethods
        
        # Default Options
        class_inheritable_reader :log_plus_options
        write_inheritable_attribute :log_plus_options, options
      end
    end
  end
end
