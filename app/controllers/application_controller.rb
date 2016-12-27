class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit!}
  end

  def if_user_admin
    redirect_to root_path unless current_user.is_admin?
  end

  def log(user_id, action, comment)
    Log.create(user_id: user_id, action: action, comment: comment)
  end
end
