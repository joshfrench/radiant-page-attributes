class PageAttribute < ActiveRecord::Base
  validates_presence_of :page_id
  validates_presence_of :name
  belongs_to :page
  set_inheritance_column :class_name

  before_save :serialize!

  def self.new(attributes={})
    attributes = HashWithIndifferentAccess.new(attributes)
    new_record = super(attributes)
    unless attributes[:class_name].blank?
      new_record = new_record.becomes(attributes[:class_name].constantize)
      new_record.class_name = attributes[:class_name]
    end
    new_record
  end

  def file_name
    self.class.name.underscore
  end
  
  def partial_name
    "_#{file_name}"
  end
  
  # Override to change behavior when the page is rendered
  def render
  end
  
  # Required override for saving data from form
  def serialize!
    raise
  end
end
