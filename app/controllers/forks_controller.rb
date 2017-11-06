class ForksController < ApplicationController

  def create
    @fork = Fork.new(params[:forks].permit(:user_id,:answer_id))
    @fork.save
  end

end
