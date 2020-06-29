# frozen_string_literal: true

class ShopUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # ログイン後および新規登録後のリダイレクト先を変更
  def after_sign_in_path_for(resource)
    if current_shop_user
      flash[:notice] = "ログインに成功しました。"
      stores_path(current_shop_user) #　指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。次に店舗情報を入力してください。"
      new_store_path #　指定したいパスに変更
    end
  end

  # ログアウト後のリダイレクト先を変更
  def after_sign_out_path_for(resource)
    flash.delete(:notice)
    flash[:alert] = "ログアウトしました。"
    root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
