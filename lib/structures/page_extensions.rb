module Structures
  module PageExtensions
    
    def self.included(base)
      base.class_eval do
        has_many :page_attributes
      end
    end
     
  end
end