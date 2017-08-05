class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 1..5 }

end
