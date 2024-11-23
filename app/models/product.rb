class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 150 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :enabled, inclusion: { in: [ true, false ] }
end
