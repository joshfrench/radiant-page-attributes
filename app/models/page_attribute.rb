class PageAttribute < ActiveRecord::Base
  validates_presence_of :page_id
  validates_presence_of :name
  belongs_to :page
  set_inheritance_column :class_name

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
