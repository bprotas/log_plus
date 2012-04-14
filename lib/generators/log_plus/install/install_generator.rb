module LogPlus
  class InstallGenerator < Rails::Generators::Base
  	source_root File.join(File.dirname(__FILE__), "..", "templates")

    desc "Installs additional LogPlus resources."
    def install
      # TODO - Add install code here.
    end
  end
end
