require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  
  it "should find by name" do
    page = pages(:first)
    s = SimpleString.new(:name => 'foo', :value => 'bar')
    page.page_attributes << s
    page.reload.page_attributes['foo'].should eql('bar')
  end
  
  it "should set page_id when saving targets" do
    page = pages(:first)
    s = SimpleString.new(:name => 'foo', :value => 'bar')
    page.page_attributes << s
    s.reload.page_id.should eql(page_id(:first))
  end
  
  it "should accept POST-like params" do
    page = Page.new
    page.update_attributes(:title => 'Test', :slug => 'test', :breadcrumb => 'test',
                           :status_id => 100, 
                           :build_page_attributes => { 0 => {:name => 'Sample Attr',
                                                             :class_name => 'SimpleBoolean',
                                                             :value => '1' } }
                          )
    page.save!
    page.reload.page_attributes
  end
  
  it "should destroy associated page attributes" do
    bool = SimpleBoolean.new(:name => 'bool', :value => true)
    page = pages(:first)
    page.page_attributes << bool
    lambda {
      page.destroy
    }.should change(PageAttribute, :count).by(-1)
  end

end