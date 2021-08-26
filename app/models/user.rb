class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :listings
  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'invalid email'}
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only use letters" }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only use letters" }
end
