class CommentsController < ApplicationController
  
  def create
    @micropost = Micropost.find_by(micropost_id: params[:micropost_id])
    @comment = @micropost.comments.build(comment_params)
    if @comment.save
      redirect_to root_path
    else
      flash[:notice] = "コメントできませんでした"
      redirect_to root_path
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to root_path
  end
  
   private

    def comment_params
      params.require(:comment).permit(:content)
    end
    
  
end
