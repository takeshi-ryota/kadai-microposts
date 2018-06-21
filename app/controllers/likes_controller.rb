class LikesController < ApplicationController
  def create
    micropost = Micropost.find(params[:like_id])
    current_user.like(micropost)
    flash[:success] = 'MicropostをLikeしました'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    current_user.unlike(micropost)
    flash[:success] = 'MicropostのLikeを解除'
    redirect_to root_url
  end
  
  def likes
    @microposts = current_user.microposts.where(likings).order('created_at DESC').page(params[:page])
  end
  

end
