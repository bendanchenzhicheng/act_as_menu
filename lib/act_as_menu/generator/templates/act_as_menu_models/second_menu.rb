# -*- encoding : utf-8 -*-
class SecondMenu < ActiveRecord::Base
  has_many :third_menus
  belongs_to :first_menu
end
