require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  
  before do
    @page_attrs = { :title => 'Page', :slug => 'Slug', :breadcrumb => 'Crumb', :status_id => 100 }
  end
  
  it "should accept key/value pairs" do
    page = Page.new
    page.page_attributes['foo'] = 'bar'
    attr = page.page_attributes.first
    attr.name.should eql('foo')
    attr.value.should eql('bar')
  end
  
  it "should find by name" do
    page = pages(:first)
    page.page_attributes['foo'] = 'bar'
    page.save
    
    page.reload
    page.page_attributes['foo'].should eql('bar')
  end
  
  it "should save attributes when new" do
    page = Page.new(@page_attrs)
    page.page_attributes['foo'] = 'bar'
    page.save!
    
    page.reload
    page.page_attributes['foo'].should eql('bar')
  end
  
  it "should set page_id when saving targets" do
    page = pages(:first)
    page.page_attributes['foo'] = 'bar'
    page.save
    page.reload
    page.page_attributes.first.page_id.should eql(page.id)
  end
  
  it "should accept POST-like params" do
    page = Page.new
    page.update_attributes(:title => 'Test', :slug => 'test', :breadcrumb => 'test',
                           :status_id => 100, 
                           :build_page_attributes => { 'sample_attr' => {
                                                  :name => 'Sample Attr',
                                                  :class_name => 'SimpleBoolean',
                                                  :value => '1'
                           } })
    page.save!
    page.reload.page_attributes
  end
  
end