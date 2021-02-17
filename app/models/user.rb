class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records
  with_options presence: true do
    validates :nickname
    validates :birth_date
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください' } do
    validates :sir_name
    validates :name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/, message: 'にはカタカナを使用してください' } do
    validates :sir_name_reading
    validates :name_reading
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
end
