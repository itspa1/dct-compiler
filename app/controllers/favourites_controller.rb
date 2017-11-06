class FavouritesController < ApplicationController


  def create
    @favourite = Favourite.new(params[:favourites].permit(:user_id,:assignment_id))
    @favourite.save
  end

  def destroy
    @favourite = Favourite.find_by(user_id: params[:user_id],assignment_id: params[:assignment_id])
    @favourite.destroy
  end

end
