class UsersController < ApplicationController

def index
  @stream = Twitter.user_timeline("uiowa")
  @current_user = Twitter.user
end
end
