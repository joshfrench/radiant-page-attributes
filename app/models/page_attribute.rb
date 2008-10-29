class PageAttribute < ActiveRecord::Base
  set_inheritance_column :class_name
    
  validates_presence_of :page
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :page_id
  validate :valid_class_name

  belongs_to :page

  class_inheritable_accessor :storage_column
  
  class << self
    def new(attributes={})
      attributes = HashWithIndifferentAccess.new(attributes)
      value = attributes.delete(:value)
      new_record = super(attributes)
      if klass_name = attributes.delete(:class_name) and self.base_class.is_descendant_class_name?(klass_name)
        klass = klass_name.constantize
        new_record = new_record.becomes(klass)
        new_record.class_name = klass_name
        new_record.write_attribute(klass.storage_column, value)
      end
      new_record
    end
    
    def storage(type)
      self.storage_column = "#{type}_value"
      alias_attribute :value, self.storage_column
    end

    def display_name
      self.name.titleize
    end

    def partial_name
      self.name.gsub(" ", '').underscore
    end
  end
  
  def class_name=(klass)
    self.write_attribute(:class_name, klass) if self.class.base_class.is_descendant_class_name?(klass)
  end
  
  private

    def valid_class_name
      unless PageAttribute.is_descendant_class_name?(class_name)
        errors.add :class_name, "must be set to a valid descendant of PageAttribute"
      end
    end
  
    def self.is_descendant_class_name?(class_name)
      (PageAttribute.descendants.map(&:to_s) + [nil, "", "PageAttribute"]).include?(class_name)
    end
end
