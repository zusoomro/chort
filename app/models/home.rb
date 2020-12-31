class Home < ApplicationRecord
  has_many :chores, dependent: :destroy
  has_and_belongs_to_many :users
  
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
