class PageAttribute < ActiveRecord::Base
  set_inheritance_column :class_name
    
  validates_presence_of :page
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :page_id
  validate :valid_class_name
  
  belongs_to :page

  before_save :serialize!
  
  def self.new(attributes={})
    attributes = HashWithIndifferentAccess.new(attributes)
    new_record = super(attributes)
    if klass_name = attributes.delete(:class_name) and
       [self.base_class, *self.base_class.descendants].include?(klass = klass_name.constantize)
      new_record = new_record.becomes(klass)
      new_record.class_name = klass_name
    end
    new_record
  end
  
  def class_name=(klass)
    self.write_attribute(:class_name, klass) if [self.base_class, *self.base_class.descendants].map(&:name).include?(klass)
  end

  def self.display_name
    self.name.titleize
  end
  
  def self.partial_name
    self.name.gsub(" ", '').underscore
  end
  
  # Override to change behavior when the page is rendered
  def render
  end
  
  # Override for saving data from form
  def serialize!
    return self
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
