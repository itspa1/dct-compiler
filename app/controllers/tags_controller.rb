class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    respond_to do |format|
      format.json { render json: @tags,except: [:taggings_count] }
    end
  end

  def question_filter
    @tag_name = params[:tag_name].split(",")
    @type = params[:type]
    if @type == "exact"
      @questions = Assignment.tagged_with(@tag_name,:match_all => true)
    else
      @questions = Assignment.tagged_with(@tag_name,:any => true)
    end
    respond_to do |format|
      format.json { render json: @questions,only: [:id,:title,:body]}
    end
  end

end
