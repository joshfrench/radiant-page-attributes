require File.dirname(__FILE__) + '/../spec_helper'

describe PageAttribute do
  scenario :pages
  
  before(:each) do
    @s = PageAttribute.new(:name => "Should I?", :boolean_value => true,
                           :class_name => "SimpleBoolean", :page => pages(:home))
  end

  it "should give a display_name for the class" do
    SimpleBoolean.display_name.should == "Simple Boolean"
  end
  
  it "should give a template name based on the class name" do
    SimpleBoolean.partial_name.should == "simple_boolean"
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

  it "should not set class_name if param is invalid" do
    p = PageAttribute.new(:class_name => 'User')
    p.should be_kind_of(PageAttribute)
  end

  it "should set storage column" do
    p = PageAttribute.new(:boolean_value => true, :string_value => 'marmelade')
    PageAttribute.storage(:boolean)
    p.value.should eql(true)

    PageAttribute.storage(:string)
    p.value.should eql('marmelade')
  end
end
