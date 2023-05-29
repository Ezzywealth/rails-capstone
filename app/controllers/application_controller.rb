class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    # Customize the redirection based on your requirements
    if resource.is_a?(User)
      # Redirect to the dashboard page for a user
      categories_path
    else
      # Redirect to a different page for another resource (if applicable)
      # For example: admin_dashboard_path if you have an admin resource
      super
    end
  end
end
