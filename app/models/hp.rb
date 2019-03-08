class Hp < ApplicationRecord
  has_many :characters, dependent: :destroy
end
