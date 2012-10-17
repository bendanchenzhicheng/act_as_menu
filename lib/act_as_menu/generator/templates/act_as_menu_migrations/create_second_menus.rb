# -*- encoding : utf-8 -*-
class CreateSecondMenus < ActiveRecord::Migration
  def self.up
    create_table :second_menus do |t|
      t.string :name
      t.string :url
      t.integer :first_menu_id


      t.timestamps
    end
  end

  def self.down
    drop_table :second_menus
  end
end
