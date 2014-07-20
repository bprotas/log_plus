module LogPlus
  class Engine < ::Rails::Engine
    isolate_namespace LogPlus

    config.max_log_size = 1 # Size in megabytes.

    initializer "log_plus.initialize" do |app|
      app.config.log_tags = [-> request { Time.current }, :remote_ip] unless app.config.log_tags

      if Rails.env.test? || Rails.env.development?
        Dir[File.join(Rails.root, "log", "*.log")].any? do |log|
          if File.size?(log).to_i > app.config.max_log_size.to_i.megabytes
            $stdout.puts "[log+] Max log size detected, clearing #{log}..."
            `> #{log}`
          end
        end
      end

      unless Rails.env.test? || Rails.env.development?
        # Configure logger to keep 7 files max at 5MB each (i.e. 1024 * 1024 * 5 = 5248000 bytes).
        app.config.logger = Logger.new "#{Rails.root}/log/#{Rails.env}.log", 7, 5248000
      end
    end
  end
end
