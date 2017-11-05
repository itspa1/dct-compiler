class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
    respond_to do |format|
      format.html {}
      format.json { render json: @tags,except: [:taggings_count] }
    end
  end

  def search
  end

  def create
    @tag = ActsAsTaggableOn::Tag.new(params[:acts_as_taggable_on_tag].permit(:name))
		@tag.save
  end


  def questions
    # @response = {}
    @tag_name = params[:tag_name].split(",")
    @type = params[:search_type]
    if @type == "exact"
      @questions = Assignment.tagged_with(@tag_name,:match_all => true)
    else
      @questions = Assignment.tagged_with(@tag_name,:any => true)
    end
    # @response["response"] = @questions
    respond_to do |format|
      format.json { render json: @questions,only: [:title,:code,:body,:is_allowed]}
    end
  end

  def question_filter
    @tag_name = params[:tag_name].split(",")
    @type = params[:type]
    if @type == "exact"
      @questions = Assignment.tagged_with(@tag_name,:match_all => true).where("is_allowed = ?",true)
    else
      @questions = Assignment.tagged_with(@tag_name,:any => true).where("is_allowed = ?",true)
    end
    respond_to do |format|
      format.json { render json: @questions,only: [:id,:title,:body],include: :tags }
    end
  end



end
