require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PageAttributesController do
  scenario :users
  
  before do
    login_as :admin
  end
  
  it "should create a new page attribute" do
    xhr :post, :create, :page_attribute => { :name => 'Test', :class_name => 'SimpleBoolean' }
    response.should be_success
    response.should render_template('page_attribute_row')
    attr = assigns(:page_attribute)
    attr.should be_kind_of(SimpleBoolean)
    attr.name.should eql('Test')
  end
  
end