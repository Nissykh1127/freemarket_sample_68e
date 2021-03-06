class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :points, dependent: :destroy
  has_one  :deliver_adresses, dependent: :destroy
  has_many :cards
  has_many :comments

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :password, :email, :delivery_first_name, :delivery_family_name, :delivery_first_name_kana, :delivery_family_name_kana, :prefectures, :municipality, :address, :postal_code, presence: true
end
