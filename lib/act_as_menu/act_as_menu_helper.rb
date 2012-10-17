# -*- encoding : utf-8 -*-
module ActAsMenu
  def act_as_menu
    #菜单初始化
    #TODO 根据不同的用户可以有自己的配置
    c_menu = ConfigMenu.first
    @c_menu =  "<script type='text/javascript'>
        $(document).ready(function(){ 
          $('ul.sf-menu').superfish({ 
            delay:  #{ c_menu.delay },               
            speed:  '#{ c_menu.speed }',
            animation:  {#{ c_menu.animation}:'show'},  
          }); 
        }); 
		 </script>"

  #Action: create a menu
  #获取f_menu 第一次菜单
  f_menu = FirstMenu.all
  @menu = "<ul  class='sf-menu'>"
  f_menu.each do |f|
    #if f.can_read?(current_user)
    @menu += "<li class='current'><a href='../../#{f.url}'>#{ f.name }</a>"
    @menu += "<ul>" unless f.second_menus.blank? # =>second_menus begin
      f.second_menus.each do |s|
        @menu +="<li> <a href=../../#{ s.url }>#{ s.name }</a> "

        @menu += "<ul>" unless s.third_menus.blank? # =>third_menus begin
        s.third_menus.each do |t|
          @menu +="<li> <a href=../../#{ t.url }>#{ t.name }</a></li>"
          @menu += "</li>"
        end
        @menu += "</ul>" unless s.third_menus.blank? # =>third_menus end
      end
    @menu += "</ul>" unless f.second_menus.blank? # =>second_menus end
    @menu +="</li>"
    #end
  end
  @menu += "</ul>"
  @act_as_menu = ( @c_menu + @menu).html_safe
  end
end
