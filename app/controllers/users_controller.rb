class UsersController < ApplicationController
  def show
    puts "SHOW"
    @user = User.find_by username: params['username']
    puts @user
  end
end
