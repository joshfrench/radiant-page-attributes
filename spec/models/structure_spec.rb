require File.dirname(__FILE__) + '/../spec_helper'

describe Structure do
  before(:each) do
    @structure = Structure.new
  end

  it "should be valid" do
    @structure.should be_valid
  end
end
