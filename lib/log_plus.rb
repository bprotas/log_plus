require File.join File.dirname(__FILE__), "log_plus", "version.rb"

# Rails Enhancements
if defined? Rails
  # Dependencies
  require File.join File.dirname(__FILE__), "log_plus", "active_record", "class_methods.rb"
  require File.join File.dirname(__FILE__), "log_plus", "active_record", "instance_methods.rb"
  require File.join File.dirname(__FILE__), "log_plus", "action_view", "instance_methods.rb"
  require File.join File.dirname(__FILE__), "log_plus", "action_controller", "class_methods.rb"
  require File.join File.dirname(__FILE__), "log_plus", "action_controller", "instance_methods.rb"

  # Model
  if defined? ActiveRecord
    ActiveRecord::Base.send :include, LogPlus::ActiveRecord
  end

  # View
  if defined? ActionView
    ActionView::Base.send :include, LogPlus::ActionView
  end
 
  # Controller
  if defined? ActionController
    ActionController::Base.send :include, LogPlus::ActionController
  end
end
