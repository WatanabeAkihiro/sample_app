class TagsController < ApplicationController

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
    flash[:success] = "新しいタグが追加されました"
    redirect_to root_url
  else
    render 'new'
  end
  end

  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "タグが削除されました"
  end

  def index
    @tags = Tag.all
  end

  private

  def tag_params
  params.require(:tag).permit(:name)
  end

end
