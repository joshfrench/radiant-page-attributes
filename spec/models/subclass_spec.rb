require File.dirname(__FILE__) + '/../spec_helper'

describe SimpleBoolean do
  it "should store value as boolean" do
    a = SimpleBoolean.new(:boolean_value => false)
    a.value.should be_false
  end
  
  it "should init with boolean value" do
    a = SimpleBoolean.new(:value => true)
    a.value.should be_true
  end
end

describe SimpleDateTime do
  it "should store value as datetime" do
    a = SimpleDateTime.new(:datetime_value => Date.today)
    a.value.should eql(Date.today)
  end
  
  it "should init with datetime value" do
    a = SimpleDateTime.new(:value => Time.now)
    a.value.to_s.should eql(Time.now.to_s)
  end
end

describe SimpleInteger do
  it "should store value as integer" do
    a = SimpleInteger.new(:integer_value => 12345)
    a.value.should eql(12345)
  end
  
  it "should init with integer value" do
    a = SimpleInteger.new(:value => 54321)
    a.value.should eql(54321)
  end
end

describe SimpleString do
  it "should store value as string" do
    a = SimpleString.new(:string_value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
  
  it "should init with integer value" do
    a = SimpleString.new(:value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
end

describe SimpleText do
  it "should store value as text" do
    a = SimpleString.new(:string_value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
  
  it "should init with integer value" do
    a = SimpleString.new(:value => %(sweet harmonious biscuits))
    a.value.should eql('sweet harmonious biscuits')
  end
end