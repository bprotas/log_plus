module LogPlus
  class UpgradeGenerator < Rails::Generators::Base
		source_root File.join(File.dirname(__FILE__), "..", "templates")

    desc "Upgrades previously installed LogPlus resources."
    def upgrade
      # TODO - Add upgrade code here.
    end
  end
end
