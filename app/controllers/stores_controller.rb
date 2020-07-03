class StoresController < ApplicationController
  before_action :authenticate_shop_user!
  before_action :store_info_exists, only: [:index]

  def index
  end

  def new
    if current_shop_user.store
      redirect_to edit_store_url(id: current_shop_user.store.id)
    else
      @store = current_shop_user.build_store
      @store.build_store_order_info
    end
  end

  def confirm
    @store = current_shop_user.build_store(store_params)
    if @store.valid?
      render :confirm
    else
      flash.now[:alert] = "error"
      render :new
    end
  end

  def create
    @store = current_shop_user.build_store(store_params)
    @store.store_order_info.delivery_reception_conclusion
    render :new and return if params[:back] || !@store.save
    redirect_to stores_url
  end

  def edit

  end

  private

    def store_params
      params.require(:store).permit(:store_name, :phone_num, :post_code, :prefecture_id, :city, :block, :building,
                                      :business_hours_start, :business_hours_finish, :holiday, :home_url,
                                      store_order_info_attributes:[:reception_email, :transport_fee, :delivery_reception_time_1,
                                      :delivery_reception_time_2, :delivery_reception_time_3, :delivery_reception_time_4,
                                      :delivery_reception_time_5, :delivery_reception_time_6, :delivery_reception_time_7,
                                      :delivery_reception_time_1_first, :delivery_reception_time_1_finish,
                                      :delivery_reception_time_2_first, :delivery_reception_time_2_finish,
                                      :delivery_reception_time_3_first, :delivery_reception_time_3_finish,
                                      :delivery_reception_time_4_first, :delivery_reception_time_4_finish,
                                      :delivery_reception_time_5_first, :delivery_reception_time_5_finish,
                                      :delivery_reception_time_6_first, :delivery_reception_time_6_finish,
                                      :delivery_reception_time_7_first, :delivery_reception_time_7_finish,
                                      :comment
                                    ])
    end

    def store_info_exists
      unless current_shop_user.store
        flash[:notice] = "はじめに店舗情報を登録してください。"
        redirect_to new_store_url
      end
    end

end
