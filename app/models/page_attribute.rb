class PageAttribute < ActiveRecord::Base
  validates_presence_of :page_id
  validates_presence_of :structure_id
  validates_presence_of :name
  belongs_to :page
  belongs_to :structure

  def file_name
    self.class.name.underscore
  end
  
  def partial_name
    "_#{file_name}"
  end
end
