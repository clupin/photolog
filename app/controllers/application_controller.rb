class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	protected

	def authenticate_normal_user!
		redirect_to root_path user_signed_in? && current_user.is_normal_user?
	end

	def authenticate_gold!
		redirect_to root_path user_signed_in? && current_user.is_gold?
	end

	def authenticate_admin!
		redirect_to root_path unless user_signed_in? && current_user.is_admin?
	end


end
