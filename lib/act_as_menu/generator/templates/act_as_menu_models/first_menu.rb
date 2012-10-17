# -*- encoding : utf-8 -*-
class FirstMenu < ActiveRecord::Base
  has_many :second_menus
end
