class Home < ApplicationRecord
  has_many :chores, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
