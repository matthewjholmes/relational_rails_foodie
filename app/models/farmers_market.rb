class FarmersMarket < ApplicationRecord
  has_many :produces, dependent: :destroy
end 