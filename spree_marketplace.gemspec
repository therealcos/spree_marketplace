# -*- encoding: utf-8 -*-
# stub: spree_marketplace 2.0.0.beta ruby lib

Gem::Specification.new do |s|
  s.name = "spree_marketplace"
  s.version = "2.0.0.beta"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jeff Dutil"]
  s.date = "2015-01-24"
  s.description = "By extending Spree Drop Ship to enable supplier payments Spree works as a Marketplace."
  s.email = "jdutil@burlingtonwebapps.com"
  s.files = [".gitignore", ".rspec", ".travis.yml", "Gemfile", "LICENSE", "README.md", "Rakefile", "Versionfile", "app/assets/javascripts/spree/frontend/spree_marketplace.js", "app/assets/javascripts/spree/frontend/supplier_address.js.coffee", "app/assets/stylesheets/spree/backend/spree_marketplace.css", "app/assets/stylesheets/spree/frontend/spree_marketplace.css", "app/controllers/spree/admin/marketplace_settings_controller.rb", "app/controllers/spree/admin/supplier_bank_accounts_controller.rb", "app/controllers/spree/suppliers_controller.rb", "app/models/spree/marketplace_ability.rb", "app/models/spree/marketplace_configuration.rb", "app/models/spree/supplier_ability.rb", "app/models/spree/supplier_bank_account.rb", "app/models/spree/supplier_decorator.rb", "app/overrides/spree/admin/shared/_configuration_menu/add_marketplace_settings.html.erb.deface", "app/overrides/spree/admin/suppliers/edit/add_bank_accounts.html.erb.deface", "app/overrides/spree/layouts/admin/add_stripe_js_to_head.html.erb.deface", "app/overrides/spree/users/show/add_supplier_info.html.erb.deface", "app/views/spree/admin/marketplace_settings/edit.html.erb", "app/views/spree/suppliers/new.html.erb", "config/locales/en.yml", "config/locales/es.yml", "config/routes.rb", "db/migrate/20130424201333_create_supplier_bank_accounts.rb", "db/migrate/20131209022116_convert_to_stripe.rb", "lib/generators/spree_marketplace/install/install_generator.rb", "lib/spree_marketplace.rb", "lib/spree_marketplace/engine.rb", "lib/spree_marketplace/factories.rb", "script/rails", "spec/features/admin/bank_accounts_spec.rb", "spec/features/admin/products_spec.rb", "spec/features/admin/properties_spec.rb", "spec/features/admin/relations_spec.rb", "spec/features/admin/return_authorizations_spec.rb", "spec/features/admin/settings_spec.rb", "spec/features/admin/suppliers_controller_spec.rb", "spec/features/supplier_signup_spec.rb", "spec/models/spree/marketplace_ability_spec.rb", "spec/models/spree/supplier_ability_spec.rb", "spec/models/spree/supplier_bank_account_spec.rb", "spec/models/spree/supplier_spec.rb", "spec/spec_helper.rb", "spec/support/integration_helpers.rb", "spree_marketplace.gemspec"]
  s.homepage = "https://github.com/jdutil/spree_marketplace"
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.requirements = ["none"]
  s.rubygems_version = "2.4.4"
  s.summary = "Enable Spree to work as a Marketplace."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<stripe>, [">= 0"])
      s.add_runtime_dependency(%q<spree_core>, [">= 2.4.3.beta"])
      s.add_runtime_dependency(%q<spree_drop_ship>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["~> 2.2"])
      s.add_development_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_development_dependency(%q<ffaker>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.99"])
      s.add_development_dependency(%q<sass-rails>, ["~> 4.0.2"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_development_dependency(%q<spree_digital>, [">= 0"])
      s.add_development_dependency(%q<spree_editor>, [">= 0"])
      s.add_development_dependency(%q<spree_group_pricing>, [">= 0"])
      s.add_development_dependency(%q<spree_related_products>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<stripe>, [">= 0"])
      s.add_dependency(%q<spree_core>, [">= 2.4.3.beta"])
      s.add_dependency(%q<spree_drop_ship>, [">= 0"])
      s.add_dependency(%q<capybara>, ["~> 2.2"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_dependency(%q<ffaker>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.99"])
      s.add_dependency(%q<sass-rails>, ["~> 4.0.2"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_dependency(%q<spree_digital>, [">= 0"])
      s.add_dependency(%q<spree_editor>, [">= 0"])
      s.add_dependency(%q<spree_group_pricing>, [">= 0"])
      s.add_dependency(%q<spree_related_products>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<stripe>, [">= 0"])
    s.add_dependency(%q<spree_core>, [">= 2.4.3.beta"])
    s.add_dependency(%q<spree_drop_ship>, [">= 0"])
    s.add_dependency(%q<capybara>, ["~> 2.2"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl>, ["~> 4.2"])
    s.add_dependency(%q<ffaker>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.99"])
    s.add_dependency(%q<sass-rails>, ["~> 4.0.2"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    s.add_dependency(%q<spree_digital>, [">= 0"])
    s.add_dependency(%q<spree_editor>, [">= 0"])
    s.add_dependency(%q<spree_group_pricing>, [">= 0"])
    s.add_dependency(%q<spree_related_products>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
