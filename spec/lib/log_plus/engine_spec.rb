require "spec_helper"

describe LogPlus::Engine do
  let :initializer do
    LogPlus::Engine.initializers.detect { |initializer| initializer.name == "log_plus.initialize" }
  end

  before do
    Rails.env = "test"
    Rails.application.config.logger = nil
  end

  describe "default settings" do
    describe "max size" do
      it "sets log size to 1MB" do
        expect(Rails.application.config.log_plus_settings[:max_size]).to eq(1)
      end
    end

    describe "log tags" do
      it "sets log tag datetime (first parameter)" do
        travel_to Time.current do
          now = Time.current
          param = Rails.application.config.log_tags.first.call now

          expect(param).to eq(now)
        end
      end

      it "sets log tag datetime (second parameter)" do
        param = Rails.application.config.log_tags.last
        expect(param).to eq(:remote_ip)
      end
    end

    describe "logger" do
      context "local environment" do
        it "does not configure the logger" do
          initializer.run Rails.application
          logger = Rails.application.config.logger

          expect(logger).to eq(nil)
        end
      end

      context "remote environment" do
        before { Rails.env = "production" }

        it "set logger to keep 7 logs max at 5MB each" do
          initializer.run Rails.application
          logger = Rails.application.config.logger

          expect(logger.inspect).to match(/shift_age=7/)
          expect(logger.inspect).to match(/shift_size=5248000/)
        end
      end
    end
  end

  describe "log cleaning" do
    let(:small_log) { File.join Dir.pwd, "spec", "support", "files", "small.log.example" }
    let(:large_log) { File.join Dir.pwd, "spec", "support", "files", "large.log.example" }
    let(:test_log) { File.join Dir.pwd, "spec", "dummy", "log", "test.log" }

    context "local environment" do
      it "clears a log larger than max size with spaces in the name" do
        spaced_log = File.join Dir.pwd, "spec", "dummy", "log", "lots of spaces here.log"
        FileUtils.cp large_log, spaced_log

        initializer.run Rails.application

        expect(File.size(spaced_log)).to eq(0)
      end

      it "clears logs larger than max size" do
        second_log = File.join Dir.pwd, "spec", "dummy", "log", "second.log"
        FileUtils.cp large_log, test_log
        FileUtils.cp large_log, second_log

        initializer.run Rails.application

        expect(File.size(test_log)).to eq(0)
        expect(File.size(second_log)).to eq(0)
      end

      it "does not clear logs smaller than max size" do
        FileUtils.cp small_log, test_log
        initializer.run Rails.application

        first_line = File.open(test_log, &:readline)

        expect(File.size(test_log) > 0).to eq(true)
        expect(first_line).to match(/This is a small log/)
      end
    end

    context "remote environment" do
      before { Rails.env = "production" }

      it "does not clear logs larger than max size" do
        FileUtils.cp large_log, test_log
        initializer.run Rails.application

        expect(File.size(test_log) > 0).to eq(true)
      end
    end
  end

  describe "log messaging" do
    let(:dummy_log) { File.join Dir.pwd, "spec", "support", "files", "large.log.example" }
    let(:test_log) { File.join Dir.pwd, "spec", "dummy", "log", "test.log" }

    before { FileUtils.cp dummy_log, test_log }

    it "prints message with max size and file name" do
      max_size = Float(Rails.application.config.log_plus_settings.fetch :max_size)
      result = -> { initializer.run Rails.application }

      expect(&result).to output("[log+] Max size detected (#{max_size} MB), clearing #{test_log}...\n").to_stdout
    end
  end
end
