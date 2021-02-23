class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: record_address_params[:token],
      currency: 'jpy'
    )
  end

  def record_address_params
    params.require(:record_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    unless @item.user_id != current_user.id && @item.record.blank?
      redirect_to root_path
    end
  end
end
