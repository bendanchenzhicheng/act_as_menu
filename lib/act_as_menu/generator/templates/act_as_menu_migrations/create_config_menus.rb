# -*- encoding : utf-8 -*-
class CreateConfigMenus < ActiveRecord::Migration
  def self.up
    create_table :config_menus do |t|
      t.string  :speed, :default => "normal"
      t.string  :delay, :default => "800"
      t.string  :animation, :default => "height"
      t.string  :dropShadows, :default => "true"
      t.timestamps
    end
    ConfigMenu.delete_all
    ConfigMenu.create
  end

  def self.down
    drop_table :config_menus
  end
end
