require File.dirname(__FILE__) + '/../spec_helper'

class SimpleBoolean < PageAttribute
  def true_string
    "Yes"
  end
  
  def serialize!
    self.value = self.value == self.true_string
  end
end

describe PageAttribute do
  before(:each) do
    @s = SimpleBoolean.new(:name => "Should I?", :value => "Yes")
  end

  it "should give a file_name" do
    @s.file_name.should == "simple_boolean"
  end

  it "should give a partial_name" do
    @s.partial_name.should == "_simple_boolean"
  end

  it "should serialize the value" do
    @s.value = "Yes"
    @s.serialize!
    
    @s.value.should be_true
    
    @s.value = "nooooooooooo!"
    @s.serialize!
    
    @s.value.should be_false
  end
end
