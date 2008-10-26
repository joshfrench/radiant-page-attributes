# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class StructuresExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/structures"
  
  define_routes do |map|
    map.admin_page_attribute_form 'admin/page_attributes/form', :controller => 'admin/page_attributes', :action => "form"
  end
  
  def activate
    Page.send(:include, Structures::PageExtensions)
#    admin.page.edit.add :form, "/admin/structures/add_structure", :before => :edit_page_parts, :visibility => [:all]
    admin.page.edit.add :form, "admin/page_attributes/add_page_attribute", :after => 'edit_extended_metadata'
    admin.page.edit.add :popups, "admin/page_attributes/add_page_attribute_popup"
#    admin.page.edit.add :form, "/admin/structures/add_structure_popup", :after => :edit_popups, :visibility => [:all]
    Dir.glob(File.join(StructuresExtension.root, %w(app models), '*.rb')).each { |f| require_dependency f }
  end

  def deactivate
    # admin.tabs.remove "Structures"
  end
  
end
