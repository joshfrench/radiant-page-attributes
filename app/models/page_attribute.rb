class PageAttribute < ActiveRecord::Base
  belongs_to :page
  belongs_to :structure
end
