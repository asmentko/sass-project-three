module DevisePermittedParameters
	extend ActiveSupport::Concern

	included do
    # als had to change from before_filter to before_action
		before_action :configure_permitted_parameters
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,        keys: [:email, :password, :password_confirmation])
		devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])

	end

end

DeviseController.send :include, DevisePermittedParameters
