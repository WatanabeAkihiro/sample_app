class LikesController < ApplicationController
  def like
    like = Like.new(user_id: current_user.id,
              micropost_id: params[:micropost_id]
    )
    if like.save
      redirect_to root_path
    else
      flash[:notice] = "Likeできませんでした"
      redirect_to root_path
    end
  end
  
  def unlike
    like = Like.find_by(user_id: current_user.id,
              micropost_id: params[:micropost_id]
    )
    like.destroy
    redirect_to root_path
  end
end
