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
     
  end
end