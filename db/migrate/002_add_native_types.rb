class AddNativeTypes < ActiveRecord::Migration
  def self.up
    rename_column :page_attributes, :value, :text_value
    add_column :page_attributes, :boolean_value, :boolean
    add_column :page_attributes, :integer_value, :integer
    add_column :page_attributes, :datetime_value, :datetime
    add_column :page_attributes, :string_value, :string
  end
  
  def self.down
    rename_column :page_attributes, :text_value, :value
    remove_column :page_attributes, :boolean_value
    remove_column :page_attributes, :integer_value
    remove_column :page_attributes, :datetime_value
    remove_column :page_attributes, :string_value
  end
end