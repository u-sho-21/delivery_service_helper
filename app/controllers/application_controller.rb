class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    # devise新規登録時のストロングパラメータ追加
    def configure_permitted_parameters
      # 新規登録時のストロングパラメータに「login_idカラムとnameカラムとphone_numカラム」の追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:login_id, :name, :phone_num])
    end


end
