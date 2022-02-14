class Product < ApplicationRecord

  # paranoia gem
  acts_as_paranoid
  belongs_to :store
  validates :name, :description, :price, :store_id, presence: true
end
