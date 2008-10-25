class Admin::PageAttributesController < ApplicationController
  def add_structure
    attribute = PageAttribute.new(params[:attribute])
    @index = params[:index].to_i if params[:index]
    render(:partial => 'page_attribute', :object => attribute, :layout => false)
  end

end
