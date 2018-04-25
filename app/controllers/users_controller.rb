class UsersController < ApplicationController
  def show
    puts "SHOW"
    @user = User.find_by username: params["id"]
    puts @user
  end
end
