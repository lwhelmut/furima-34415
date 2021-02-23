class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_date_forecast
  belongs_to :shipping_price_responsibility

  with_options presence: true do
    validates :item_name
    validates :item_explanation
    validates :image

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :shipping_price_responsibility_id
      validates :prefecture_id
      validates :shipping_date_forecast_id
    end
    validates :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
    validates :item_price, numericality: { with: /\A[0-9]+\z/, message: 'には半角数値を使用してください' }
  end
end
