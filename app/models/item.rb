class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image



  validates :item_name, presence: true
  validates :text, presence: true
  validates :price, presence: true  
  validates :image, presence: true
end
