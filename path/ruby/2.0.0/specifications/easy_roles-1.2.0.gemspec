# -*- encoding: utf-8 -*-
# stub: easy_roles 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "easy_roles"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Platform45"]
  s.date = "2011-08-18"
  s.description = "Easy role authorization in rails"
  s.email = "ryan@platform45.com"
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.rdoc", "lib/easy_roles.rb", "lib/generators/active_record/easy_roles_generator.rb", "lib/generators/active_record/templates/migration_bitmask.rb", "lib/generators/active_record/templates/migration_non_bitmask.rb", "lib/generators/easy_roles/easy_roles_generator.rb", "lib/generators/templates/README"]
  s.files = ["CHANGELOG.rdoc", "README.rdoc", "lib/easy_roles.rb", "lib/generators/active_record/easy_roles_generator.rb", "lib/generators/active_record/templates/migration_bitmask.rb", "lib/generators/active_record/templates/migration_non_bitmask.rb", "lib/generators/easy_roles/easy_roles_generator.rb", "lib/generators/templates/README"]
  s.homepage = "http://github.com/platform45/easy_roles"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Easy_roles", "--main", "README.rdoc"]
  s.rubyforge_project = "easy_roles"
  s.rubygems_version = "2.5.1"
  s.summary = "Easy role authorization in rails"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
