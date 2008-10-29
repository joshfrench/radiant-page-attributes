class Admin::PageAttributesController < ApplicationController
  def form
    page_attribute = PageAttribute.new(params[:page_attribute])
    render(:partial => 'page_attribute_row', :object => page_attribute, :layout => false)
  end
end
