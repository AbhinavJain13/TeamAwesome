class StreamsController < ApplicationController

before_filter :set_current_user

def index
  @stream = Twitter.user_timeline("uiowa")
  #@current_user = Twitter.user
end
end
