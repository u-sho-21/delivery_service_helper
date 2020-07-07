# frozen_string_literal: true

class ShopUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # POST /resource/sign_up/confirm
  def confirm
    @shop_user = ShopUser.new(sign_up_params)
    if @shop_user.valid?
      render :confirm
    else
      render :new
    end
  end

  # GET /resource/sign_up
  def new
    # super
    @shop_user = ShopUser.new
  end

  # POST /resource
  def create
    # super
    @shop_user = ShopUser.new(sign_up_params)
    render :new and return if params[:back] || !@shop_user.save
  end

  # GET /resource/sign_up/:id
  def show
    @shop_user = current_shop_user
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    # super
    flash[:notice] = "変更しました。"
    redirect_to show_shop_user_registration_url
  end

  # DELETE /resource
  def destroy
    super
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
