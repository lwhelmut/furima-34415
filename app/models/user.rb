class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records
  validates :nickname, presence: true
  validates :sir_name, presence: true
  validates :name, presence: true
  validates :sir_name_reading, presence: true
  validates :name_reading, presence: true
  validates :birth_date, presence: true
end
