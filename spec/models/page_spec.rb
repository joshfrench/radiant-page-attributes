require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  
  before do
    @page_attrs = { :title => 'Page', :slug => 'Slug', :breadcrumb => 'Crumb', :status_id => 100 }
  end
  
  it "should accept an attribute when a new record" do
    page = Page.new(:build_page_attributes => {:structure_id => 1, :name => 'Foo', :value => 'Bar'})
    page.page_attributes.first.name.should eql('Foo')
  end
  
  it "should save attributes when a new record" do
    page = Page.new(@page_attrs.merge(:build_page_attributes => {:structure_id => 1, :name => 'Foo', :value => 'Bar'}))
    page.page_attributes.first.name.should eql('Foo')
    page.save!
    page.reload.page_attributes.first.name.should eql('Foo')
  end
  
  it "should accept an attribute when already saved" do
    page = pages(:first)
    page.build_page_attributes = {:structure_id => 1, :name => 'Foo', :value => 'Bar'}
    page.save!
    page.reload.page_attributes.first.name.should eql('Foo')
  end
  
  it "should overwrite existing page_attributes" do
    page = pages(:first)
    page.build_page_attributes = {:structure_id => 1, :name => 'Foo', :value => 'Bar'}
    page.save!
    
    page.build_page_attributes = {:structure_id => 1, :name => 'Replacement', :value => 'New'}
    page.save!
    attrs = page.reload.page_attributes
    attrs.size.should eql(1)
    attrs.first.name.should eql('Replacement')
  end
  
  it "should clear page_attributes" do
    page = pages(:first)
    page.build_page_attributes = {:structure_id => 1, :name => 'Foo', :value => 'Bar'}
    page.save
    page.reload
    page.build_page_attributes = nil
    page.save
    page.reload
    page.page_attributes.should be_empty
  end
  
end