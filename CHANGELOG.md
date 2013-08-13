# v2.0.0

* Dropped Rails 3.1.x support.
* Upgraded to Rails 4.0.0.
* Switched to using 'https://rubygems.org' instead of :rubygems for gem source.
* Updated secure key for Campfire notifications.
* Cleaned up RSpec spec definitions so that class and instance methods are described properly using . and # notation.
* Treat symbols and true values by default when running RSpec specs.
* Added .ruby-version support.
* Added pry-rescue support.
* Removed the CHANGELOG documentation from gem install.
* Added a Versioning section to the README.
* Converted from RDoc to Markdown documentation.
* Added public cert for secure install of gem.
* Switched from the pry-debugger to pry-byebug gem.
* Ignore the signing of a gem when building in a Travis CI environment.

# v1.0.0

* Updated the Engine initializer string.
* Added Guard support.
* Converted/detailed the CONTRIBUTING guidelines per GitHub requirements.
* Added Gem Badge support.
* Added Code Climate support.
* Added Campfire notification support.
* Switched from HTTP to HTTPS when sourcing from RubyGems.
* Added Pry development support.
* Added 'tmp' directory to .gitignore.
* Cleaned up requirement path syntax.

# v0.1.0

* Initial version.
