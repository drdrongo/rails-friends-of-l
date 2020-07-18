class Event < ApplicationRecord
  belongs_to :user
  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets

  validates :title, :description, :datetime, :venue, :capacity, :category, :end_time, presence: true
end
