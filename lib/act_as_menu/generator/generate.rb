# -*- encoding : utf-8 -*-
require "rails/generators"
require "rails/generators/migration"

#继承rails的generator，为menu定义自己的genertor
class CreateMenuAll < Rails::Generators::Base
  include Rails::Generators::Migration
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__),"templates")
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_menu_model_file
    template "act_as_menu_models/config_menu.rb","app/models/config_menu.rb"
    template "act_as_menu_models/first_menu.rb","app/models/first_menu.rb"
    template "act_as_menu_models/second_menu.rb","app/models/second_menu.rb"
    template "act_as_menu_models/third_menu.rb","app/models/third_menu.rb"
  end

  def create_menu_migration_file
    migration_template "act_as_menu_migrations/create_config_menus.rb","db/migrate/create_config_menus.rb"
    migration_template "act_as_menu_migrations/create_first_menus.rb","db/migrate/create_first_menus.rb"
    migration_template "act_as_menu_migrations/create_second_menus.rb","db/migrate/create_second_menus.rb"
    migration_template "act_as_menu_migrations/create_third_menus.rb","db/migrate/create_third_menus.rb"
  end

  def create_widget_file
    directory "act_as_menu_css","public/stylesheets/act_as_menu_css"
    directory "act_as_menu_images","public/images/act_as_menu_images"
    directory "act_as_menu_js","public/javascripts/act_as_menu_js"
  end
end

class CreateMenuModel < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__),"templates")
  end

  def create_menu_model_file
    template "act_as_menu_models/config_menu.rb","app/models/config_menu.rb"
    template "act_as_menu_models/first_menu.rb","app/models/first_menu.rb"
    template "act_as_menu_models/second_menu.rb","app/models/second_menu.rb"
    template "act_as_menu_models/third_menu.rb","app/models/third_menu.rb"
  end
end

class CreateMenuMigrate < Rails::Generators::Base
  include Rails::Generators::Migration
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__),"templates")
  end

  def self.next_migration_number(path)
    unless ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(path) + 1)
    end
  end

  def create_menu_migration_file
    migration_template "act_as_menu_migrations/create_config_menus.rb","db/migrate/create_config_menus.rb"
    migration_template "act_as_menu_migrations/create_first_menus.rb","db/migrate/create_first_menus.rb"
    migration_template "act_as_menu_migrations/create_second_menus.rb","db/migrate/create_second_menus.rb"
    migration_template "act_as_menu_migrations/create_third_menus.rb","db/migrate/create_third_menus.rb"
  end
end

class CreateWidget < Rails::Generators::Base
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__),"templates")
  end

  def create_widget_file
    directory "act_as_menu_css","public/stylesheets/act_as_menu_css"
    directory "act_as_menu_images","public/images/act_as_menu_images"
    directory "act_as_menu_js","public/javascripts/act_as_menu_js"
  end
end
