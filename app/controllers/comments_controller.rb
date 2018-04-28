class CommentsController < ApplicationController
  before_action :set_item, only: [:destroy]

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_item_path(@item.user.username, @item)
    else
      flash.now[:danger] = "error"
    end
  end

  def destroy
    if @comment.user.id == current_user.id
      if @comment.destroy
        redirect_to user_item_path(@comment.user.username, @comment.item)
      end
    end
  end

  private
    def set_item
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
