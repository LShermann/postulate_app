class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to jobs_path, notice: "You are not authorized to perform this action"
        end
    end
 
    protected
 
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, images_attributes: [:url, :context, :id]])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, images_attributes: [:url, :context, :id]])
    end

end
