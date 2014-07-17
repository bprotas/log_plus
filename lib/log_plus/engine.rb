module LogPlus
  class Engine < ::Rails::Engine
    config.max_log_size = 1 # Size in megabytes.

    initializer "log_plus.initialize" do |app|
      app.config.log_tags = [->request{Time.now}, :remote_ip] unless app.config.log_tags

      if Rails.env.development?
        Dir[File.join(Rails.root, "log", "*.log")].any? do |log|
          if File.size?(log).to_i > app.config.max_log_size.to_i.megabytes
            $stdout.puts "[log+] Max log size detected, clearing #{log}..."
            `> #{log}`
          end
        end
      end
    end
  end
end
