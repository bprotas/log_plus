module LogPlus
  class Engine < ::Rails::Engine
    isolate_namespace LogPlus

    # Set defaults. Can be overwritten in app config.
    config.log_plus_settings = {}

    initializer "log_plus.initialize" do |app|
      app.config.log_plus_settings.reverse_merge! max_size: 1 # Size in megabytes.
      app.config.log_tags ||= [-> request { Time.current }, :remote_ip]
      max_size = Float(app.config.log_plus_settings[:max_size])

      if Rails.env.test? || Rails.env.development?
        Dir[File.join(Rails.root, "log", "*.log")].each do |log|
          if File.size?(log).to_f > max_size.megabytes
            $stdout.puts "[log+] Max size detected (#{max_size} MB), clearing #{log}..."
            `> "#{log}"`
          end
        end
      end

      unless Rails.env.test? || Rails.env.development?
        # Configure logger to keep 7 files max at 5MB each (i.e. 1024 * 1024 * 5 = 5248000 bytes).
        app.config.logger = Logger.new Rails.root.join("log", "#{Rails.env}.log"), 7, 5248000
      end
    end
  end
end
