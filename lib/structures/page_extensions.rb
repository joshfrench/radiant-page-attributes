module Structures
  module PageExtensions
    
    def self.included(base)
      base.class_eval do
        has_many :page_attributes
        
        def build_page_attributes=(*args)
          self.page_attributes.destroy_all
          args.compact.each do |page_attribute|
            self.page_attributes.build(page_attribute)
          end
          self.page_attributes
        end
        
      end
    end
     
  end
end