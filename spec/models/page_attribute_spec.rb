require File.dirname(__FILE__) + '/../spec_helper'

class SimpleBoolean < PageAttribute
end

describe PageAttribute do
  before(:each) do
    @pa = SimpleBoolean.new(:name => "Should I?")
  end

  it "should give a file_name" do
    @pa.file_name.should == "simple_boolean"
  end

  it "should give a partial_name" do
    @pa.partial_name.should == "_simple_boolean"
  end
  
  it "should cast to subclass on instantiate" do
    attribute = PageAttribute.new('class_name' => 'SimpleBoolean')
    attribute.should be_kind_of(SimpleBoolean)
  end
  
  it "should be a PageAttribute if not passed a subclass" do
    attribute = PageAttribute.new
    attribute.should be_kind_of(PageAttribute)
  end
end
