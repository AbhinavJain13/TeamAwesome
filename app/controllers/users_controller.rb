class UsersController < ApplicationController
  def add_user
    User.create_user(params[:user])
  end
end
