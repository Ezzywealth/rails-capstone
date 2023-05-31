class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:create, keys: [:category_id])
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

  def after_sign_out_path_for(_resource)
    root_path
  end
end
