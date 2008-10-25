require File.dirname(__FILE__) + '/../spec_helper'

class SimpleBoolean < PageAttribute
  def serialize!
    self.value = (self.value.to_i == 1)
  end
end

describe PageAttribute do
  before(:each) do
    @s = PageAttribute.new(:name => "Should I?", :value => "Yes", :class_name => "SimpleBoolean", :page_id => 4)
  end

  it "should give a param_name" do
    @s.param_name.should == "should_i"
  end

  it "should give a display_name for the class" do
    SimpleBoolean.display_name.should == "Simple Boolean"
  end
  
  it "should cast to subclass on instantiate" do
    attribute = PageAttribute.new('class_name' => 'SimpleBoolean')
    attribute.should be_kind_of(SimpleBoolean)
  end
  
  it "should be a PageAttribute if not passed a subclass" do
    attribute = PageAttribute.new
    attribute.should be_kind_of(PageAttribute)
  end

  it "should serialize the value" do
    @s.value = "1"
    @s.serialize!
    
    @s.value.should be_true
    
    @s.value = "nooooooooooo!"
    @s.serialize!
    
    @s.value.should be_false
  end

  it "should serialize! before saving" do
    @s.value = "1"
    @s.save!
    
    @s.value.should == true
  end
end
