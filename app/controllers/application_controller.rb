class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_customer
      customer_genres_path
    else
      admin_notifications_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :body, :image_id])
  end
end
