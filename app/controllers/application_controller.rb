class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters,if: :devise_controller?
	before_action :authenticate_user!,except: [:top,:about]

	def after_sign_up_path_for(resouece)
		user_path(current_user.id)
	end

	def after_sign_in_path_for(resouece)
		user_path(current_user.id)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys: [:email,:postcode,:prefecture_code,:address_city,:address_street,:address_building])
		# devise_parameter_sanitizer.permit(:sign_in,keys: [:name])
	end
end
