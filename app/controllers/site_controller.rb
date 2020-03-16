class SiteController < ApplicationController
  def index
    @current_user_id = User.last.id.to_s
    puts(@current_user_id)
  end
end