class UsersController < ApplicationController
	before_action :authenticate_user!, :only => [:show]
	
	def show
		@user = User.where(:id => params[:id]).first
		if @user.blank?
		  render :text => "User is Not Found", :status => :not_found
		end
  end
end