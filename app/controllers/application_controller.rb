class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception

	
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :nombre, :apellido, :email, :password, :password_confirmation)}
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username,:nombre, :apellido, :email, :password, :current_password, :permission_level) }
	end

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
