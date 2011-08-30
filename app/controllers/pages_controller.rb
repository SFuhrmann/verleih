class PagesController < ApplicationController
  def home
    if user_signed_in?
      if Search.where(:user_id => current_user.id).empty?
        @search = Search.new
        @search.user_id = current_user.id
        @search.save
      end
    end
  end

end
