class MenusController < StoresController

  def index
    @menus = Store.current_store(current_shop_user).menus
  end

  def new
	  @menu = Store.current_store(current_shop_user).menus.build
  end


  def create
    @menu = Store.current_store(current_shop_user).menus.build(menu_params)
    if @menu.save
      flash[:notice] = "登録しました。"
      redirect_to store_menus_url
    else
      format.html { render :new }
      format.json { render json: @menu.errors, status: :unprocessable_entity }
      format.js { @status = "fail" }
    end
  end

  def edit
    @menu = Store.current_store(current_shop_user).menus.find(params[:id])
  end

  def update
    @menu = Store.current_store(current_shop_user).menus.find(params[:id])
    if @menu.update(menu_params)
      flash[:notice] = "#{@menu.menu_name}の編集をしました"
      redirect_to store_menus_url
    else
      flash.now[:alert] = "error" # 仮
      render :edit
    end
  end

  def destroy
    @menu = Store.current_store(current_shop_user).menus.find(params[:id])
    @menu.destroy
    flash[:notice] = "削除しました。"
    redirect_to store_menus_url
  end

  private

    def menu_params
      params.require(:menu).permit(:image, :menu_name, :price)
    end

    # def current_store
    #   current_shop_user.store
    # end
end
