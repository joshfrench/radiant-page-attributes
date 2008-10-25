class Structure < ActiveRecord::Base
  validates_presence_of :name
  set_inheritance_column :class_name
end
