class SearchesController < ApplicationController
  before_action :authorized
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:original_text, :search_date)
  end

end
