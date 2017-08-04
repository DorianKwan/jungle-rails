class Review < ActiveRecord::Base
  belongs_to :product_id
  belongs_to :user_id

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true
end
