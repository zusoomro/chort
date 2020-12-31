class Chore < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true
end
