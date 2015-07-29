class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :tel, :image]
    devise_parameter_sanitizer.for(:account_update) << [:name, :tel, :image]
  end
end
