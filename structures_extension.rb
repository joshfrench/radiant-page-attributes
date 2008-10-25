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
    Page.send(:include, Structures::PageExtensions)
    admin.page.edit.add :form, "/admin/structures/add_structure", :before => :edit_page_parts, :visibility => [:all]
  end

  def deactivate
    # admin.tabs.remove "Structures"
  end
  
end
