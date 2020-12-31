class User < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :homes, through: :members
  has_many :chores
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
