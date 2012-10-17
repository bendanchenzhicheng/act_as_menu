# -*- encoding : utf-8 -*-
# Include hook code here

require "act_as_menu"

ActionController::Base.send :include, ActAsMenu
ActiveRecord::Base.send :include, ActAsMenu
ActionView::Base.send :include, ActAsMenu
