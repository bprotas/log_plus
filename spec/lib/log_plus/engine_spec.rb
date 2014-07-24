require "spec_helper"

describe LogPlus::Engine do
  let :initializer do
    LogPlus::Engine.initializers.detect { |initializer| initializer.name == "log_plus.initialize" }
  end

  before { Rails.env = "test" }

  describe "settings" do
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
          skip "fails to pass when run with all specs (but doesn't when tested individually)" do
            initializer.run LogPlus::Engine
            logger = Rails.application.config.logger

            expect(logger).to eq(nil)
          end
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
    let(:small_log) { File.join Dir.pwd, "spec", "support", "small.log.example" }
    let(:large_log) { File.join Dir.pwd, "spec", "support", "large.log.example" }
    let(:test_log) { File.join Dir.pwd, "spec", "dummy", "log", "test.log" }

    context "local environment" do
      it "clears logs larger than max size" do
        FileUtils.cp large_log, test_log
        initializer.run Rails.application

        expect(File.size(test_log)).to eq(0)
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
end
