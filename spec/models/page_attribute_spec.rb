require File.dirname(__FILE__) + '/../spec_helper'

describe PageAttribute do
  before(:each) do
    @page_attribute = PageAttribute.new
  end

  it "should be valid" do
    @page_attribute.should be_valid
  end
end
