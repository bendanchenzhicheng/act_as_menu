# -*- encoding : utf-8 -*-
class CreateFirstMenus < ActiveRecord::Migration
  def self.up
    create_table :first_menus do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :first_menus
  end
end
