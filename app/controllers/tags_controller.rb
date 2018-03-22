class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all

    if params[:submitted]
      @search_results = find_tag(params)
    end
  end


  private
    def find_tag(params)
      Tag.find_by(name: params[:tag_name])
    end
end
