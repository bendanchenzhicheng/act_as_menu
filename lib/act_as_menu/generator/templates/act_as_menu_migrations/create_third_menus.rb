# -*- encoding : utf-8 -*-
class CreateThirdMenus < ActiveRecord::Migration
  def self.up
    create_table :third_menus do |t|
      t.string :name
      t.string :url
      t.integer :second_menu_id

      t.timestamps
    end
  end

  def self.down
    drop_table :third_menus
  end
end
