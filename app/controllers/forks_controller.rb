class ForksController < ApplicationController

  def myforks
    @forks = User.find(current_user.id).answers
  end


  def create
    @fork = Fork.new(params[:forks].permit(:user_id,:answer_id))
    @fork.save
  end

end
