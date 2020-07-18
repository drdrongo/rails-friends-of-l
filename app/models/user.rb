class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets, dependent: :destroy
  has_many :events, through: :tickets
  has_one_attached :photo

  validates :email, :password, :name, presence: true
end
