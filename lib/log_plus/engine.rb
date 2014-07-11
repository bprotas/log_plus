module LogPlus
  class Engine < ::Rails::Engine
    # Set defaults. Can be overwritten in app config.
    config.max_log_size = 1 # Size is in megabytes.

    initializer "log_plus.initialize" do |app|
      # Set defaults. Can be overwritten in app config.
      app.config.log_tags = [->request{Time.now}, :remote_ip] unless app.config.log_tags

      if Rails.env.development?
        # Iterate through all application log files.
        Dir[File.join(Rails.root, "log", "*.log")].any? do |log|
          # Clear the log file if greater than max size.
          if File.size?(log).to_i > app.config.max_log_size.to_i.megabytes
            $stdout.puts "[log_plus] Max log size detected, clearing the #{log} file..."
            `> #{log}` # Clear the log.
          end
        end
      end
    end
  end
end
