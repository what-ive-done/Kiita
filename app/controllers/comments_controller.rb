class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_item_path(@item.user, @item)
    else
      flash.now[:danger] = "error"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
