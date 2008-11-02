module PageAttributes
  module PageExtensions
    
    def self.included(base)
      base.class_eval do
        has_many :page_attributes, :dependent => :destroy do
          def [](name)
            if attr = self.find_by_name(name)
              attr.value
            end
          end
        end
      end
    end
    
    def build_page_attributes=(args={})
      self.page_attributes.destroy_all
      args.each_pair do |i,hash|
        attr = self.page_attributes.build(hash)
        attr.page = self
      end
      self.page_attributes
    end
     
  end
end