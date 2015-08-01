class TagsController < ApplicationController
  def index
    @tags = Tag.most_popular_sort
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    @tag_questions = @tag.newest_questions
  end
end
