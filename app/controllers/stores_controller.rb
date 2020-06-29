class StoresController < ApplicationController
  before_action :authenticate_shop_user!

  def index
  end

  private

    # shop_user情報
    def shop_user_id_info
      if shop_user_signed_in?
        shop_user_id_info = current_shop_user.id
      else
        flash[:notice] = "ログインしてください。"
        redirect_to root_path
      end
    end
end
