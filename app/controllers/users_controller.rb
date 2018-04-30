class UsersController < ApplicationController
  before_action :set_user
  before_action :set_same_user
  def show
    @items = @user.items.all

  end

  def activities
  end

  def likes
  end

  def comments
  end

  private
    def set_user
      @user = User.find_by username: params["id"] || params["user_id"]

      if @user.nil?
        redirect_to new_user_session_path
        return
      end
    end

    def set_same_user
      @isSameUser = false

      if user_signed_in? and current_user.id == @user.id
        @isSameUser = true
      end
    end
end
