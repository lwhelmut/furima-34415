class RecordAddress
  include ActiveModel::Model
  attr_accessor :token, :price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' }
    validates :house_number
    validates :phone_number, length: { is: 11, message: 'must be 11 figures'}
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: "available only with numeric characters"}
  end
  
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end