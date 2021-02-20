class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :root_item, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :item_price, :item_status_id, :shipping_price_responsibility_id, :prefecture_id, :shipping_date_forecast_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def root_item
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end
end
