class UsersController < ApplicationController
  def show
    @user = User.find_by username: params["id"]

    if @user.nil?
      redirect_to new_user_session_path
      return
    end
    @items = @user.items.all

    @isSameUser = false

    if user_signed_in? and current_user.id == @user.id
      @isSameUser = true
    end
  end
end
