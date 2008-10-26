class Admin::PageAttributesController < ApplicationController
  def form
    page_attribute = PageAttribute.new(params[:page_attribute])
    render(:partial => 'page_attribute', :locals => {:page_attribute => page_attribute}, :layout => false)
  end
end
