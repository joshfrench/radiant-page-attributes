# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StructuresExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/structures"
  
  # define_routes do |map|
  #   map.connect 'admin/structures/:action', :controller => 'admin/structures'
  # end
  
  def activate
    # admin.tabs.add "Structures", "/admin/structures", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Structures"
  end
  
end