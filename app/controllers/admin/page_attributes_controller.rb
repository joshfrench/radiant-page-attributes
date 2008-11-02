class Admin::PageAttributesController < ApplicationController
  def create
    respond_to do |format|
      format.js do
        @page_attribute = PageAttribute.new(params[:page_attribute])
        render(:partial => 'page_attribute_row', :object => @page_attribute, :layout => false)
      end
    end
  end
end
