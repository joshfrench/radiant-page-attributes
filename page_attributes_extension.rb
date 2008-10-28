# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageAttributesExtension < Radiant::Extension
  version "0.1"
  description "Add basic attributes to pages"
  url "http://radiantcms.org"
  
  define_routes do |map|
    map.admin_page_attribute_form 'admin/page_attributes/form', :controller => 'admin/page_attributes', :action => "form"
  end
  
  def activate
    Page.send(:include, PageAttributes::PageExtensions)
    admin.page.edit.add :form, "admin/page_attributes/add_page_attribute", :after => 'edit_extended_metadata'
    admin.page.edit.add :popups, "admin/page_attributes/add_page_attribute_popup"
    Dir.glob(File.join(PageAttributesExtension.root, %w(app models), '*.rb')).each { |f| require_dependency f }
  end

  def deactivate
  end
  
end
