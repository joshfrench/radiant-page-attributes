require File.dirname(__FILE__) + '/../spec_helper'

describe Structure do
  before(:each) do
    @s = Structure.new(:name => "Simple Boolean")
  end

  it "should give a file_name" do
    @s.file_name.should == "simple_boolean"
  end

  it "should give a partial_name" do
    @s.partial_name.should == "_simple_boolean"
  end
  
  it "should know where to load its definition from" do
    @s.definition_path.should == File.join(StructureExtension.root, "app", "models", "simple_boolean")
  end
end
