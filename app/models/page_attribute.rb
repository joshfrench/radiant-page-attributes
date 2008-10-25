class PageAttribute < ActiveRecord::Base
  validates_presence_of :page_id
  validates_presence_of :name
  belongs_to :page
end
