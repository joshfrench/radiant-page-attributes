module Structures
  module PageExtensions
    
    def self.included(base)
      base.class_eval do
        has_many :page_attributes do
          def []=(name,value)
            self.build(:name => name, :value => value, :page => proxy_owner)
          end
          
          def [](name)
            if attr = self.find_by_name(name)
              attr.value
            end
          end
        end
      end
    end
    
    def build_page_attributes=(args={})
      self.page_attributes.clear
      args.each_pair do |attr,hash|
        logger.info ">> #{attr.inspect}"
        attr = self.page_attributes.build(hash)
        attr.page = self
      end
      self.page_attributes
    end
     
  end
end