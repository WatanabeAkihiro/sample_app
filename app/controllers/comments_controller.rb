class CommentsController < ApplicationController
  
  def create
    # commentには「どのユーザー」が「どの投稿」にコメントしたのか？
    # micropostには「どのユーザー」が投稿したのか？
    # 
    @micropost = Micropost.find(params[:id])
    @comment = @micropost.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @micropost
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to @micropost
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to root_path
  end
  
   private

    def comment_params
      params.require(:comment).permit(:comment, :micropost_id, :user_id)
    end
    
  
end
