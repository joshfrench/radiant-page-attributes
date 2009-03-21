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
        after_save :save_page_attributes
        alias_method_chain :page_attributes, :pending
        alias_method_chain :page_attributes=, :pending
      end
    end
      
    def page_attributes_with_pending(reload=false)
      @page_attrs = nil if reload
      @page_attrs || page_attributes_without_pending(reload)
    end

    def page_attributes_with_pending=(collection)
      if collection.values.all? {|item| item.is_a? PageAttribute }
        self.page_attributes_without_pending = collection.values
      else
        self.updated_at_will_change!
        @page_attrs = collection.values.map { |item| PageAttribute.new(item.merge(:page => self)) }
      end
    end

    private

      def save_page_attributes
        if @page_attrs
          self.page_attributes_without_pending.clear
          @page_attrs.each {|p| self.page_attributes_without_pending << p }
        end
        @page_attrs = nil
        true
      end

  end
end