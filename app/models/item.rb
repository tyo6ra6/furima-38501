class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_payer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :take_time





  validates :item_name, presence: true
  validates :text, presence: true
  validates :price, presence: true, numericality: { in: 300..9999999 }
              
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_payers_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :take_times_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
