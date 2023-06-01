class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :skip_authentication?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:create, keys: [:category_id])
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      categories_path
    else
      super
    end
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def skip_authentication?
    # Return true if the current page should be excluded from authentication
    # You can use any condition you like to determine if authentication should be skipped
    # For example, to skip authentication for the welcome action of the welcome controller:
    params[:controller] == 'welcome' && params[:action] == 'index'
  end
end
