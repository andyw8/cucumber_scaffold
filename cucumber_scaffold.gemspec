# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cucumber_scaffold}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andy Waite"]
  s.date = %q{2010-11-13}
  s.description = %q{Generate scaffolding for Cucumber features and steps definitions}
  s.email = %q{andy@andywaite.com}
  s.extra_rdoc_files = ["README.rdoc", "TODO", "lib/generators/cucumber_scaffold/feature/USAGE", "lib/generators/cucumber_scaffold/feature/feature_generator.rb", "lib/generators/cucumber_scaffold/feature/templates/feature.feature", "lib/generators/cucumber_scaffold/feature/templates/steps.rb", "lib/generators/cucumber_scaffold/install/USAGE", "lib/generators/cucumber_scaffold/install/install_generator.rb", "lib/generators/cucumber_scaffold/install/templates/shared/web_steps_additional.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "TODO", "cucumber_scaffold.gemspec", "lib/generators/cucumber_scaffold/feature/USAGE", "lib/generators/cucumber_scaffold/feature/feature_generator.rb", "lib/generators/cucumber_scaffold/feature/templates/feature.feature", "lib/generators/cucumber_scaffold/feature/templates/steps.rb", "lib/generators/cucumber_scaffold/install/USAGE", "lib/generators/cucumber_scaffold/install/install_generator.rb", "lib/generators/cucumber_scaffold/install/templates/shared/web_steps_additional.rb"]
  s.homepage = %q{http://github.com/andyw8/cucumber_scaffold}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Cucumber_scaffold", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cucumber_scaffold}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Generate scaffolding for Cucumber features and steps definitions}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
