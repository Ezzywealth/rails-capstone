class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: :welcome
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

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

end
