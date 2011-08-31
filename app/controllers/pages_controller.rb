class PagesController < ApplicationController
  def home
    if user_signed_in?
      if Search.where(:user_id => current_user.id).empty?
        @search = Search.new
        @search.user_id = current_user.id
        @search.save
      end
	  if User.where(:id => current_user.id).first.dvdslent.nil?
	    User.where(:id => current_user.id).first.dvdslent = ""
	  end
    end
  end

end
