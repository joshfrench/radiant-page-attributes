class PageAttribute < ActiveRecord::Base
  validates_presence_of :page
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :page_id
  belongs_to :page
  set_inheritance_column :class_name

  before_save :serialize!

  def self.new(attributes={})
    attributes = HashWithIndifferentAccess.new(attributes)
    new_record = super(attributes)
    unless attributes[:class_name].blank?
      new_record = new_record.becomes(attributes[:class_name].constantize) # should check for subclass!
      new_record.class_name = attributes[:class_name]
    end
    new_record
  end

  def self.display_name
    self.name.titleize
  end
  
  def self.partial_name
    self.name.gsub(" ", '').underscore
  end
  
  def self.list_subclasses
    self.subclasses
  end

  def param_name
    self.name.gsub(/\s/, "_").gsub(/[^A-Za-z\-\_\.]/, '').downcase
  end
  
  # Override to change behavior when the page is rendered
  def render
  end
  
  # Override for saving data from form
  def serialize!
    return self
  end
end
