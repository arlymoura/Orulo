class SiteController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @current_user_id = User.last.id.to_s
    puts(@current_user_id)
  end
end