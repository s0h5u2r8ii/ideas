class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_out_path_for(resource)

    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:name,:name_phonetic, :profile_image,:phone_number,:email,:introduction,:prefecture])
  end
end
