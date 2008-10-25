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
end
