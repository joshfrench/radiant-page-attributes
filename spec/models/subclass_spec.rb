require File.dirname(__FILE__) + '/../spec_helper'

describe SimpleBoolean do
  it "should store value as boolean" do
    a = SimpleBoolean.new(:boolean_value => false)
    a.value.should be_false
  end  
end

describe SimpleDateTime do
  it "should store value as datetime" do
    a = SimpleDateTime.new(:datetime_value => Date.today)
    a.value.should eql(Date.today)
  end
end

describe SimpleInteger do
  it "should store value as integer" do
    a = SimpleInteger.new(:integer_value => 12345)
    a.value.should eql(12345)
  end
end

describe SimpleString do
  it "should store value as string" do
    a = SimpleString.new(:string_value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
end

describe SimpleText do
  it "should store value as text" do
    a = SimpleString.new(:string_value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
end