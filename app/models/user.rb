class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :purchase_destinations

  validates :nickname, :birthday_year, :birthday_month,:birthday_date, presence: true
  validates :email, uniqueness: true, format:  {with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/}
  validates :password,presence: true, length: { minimum: 7 }
  validates :first_name, :last_name, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, :last_name_kana, presence: true,format: {with: /\A[ぁ-んァ-ヶー－]+\z/}
end
