class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one: purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_payer
  belongs_to :area
  belongs_to :take_time

  validates :item_name, presence: true
  validates :text, presence: true
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'は ¥300~9,999,999 の間で半角数字で指定してください' }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_payer_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :take_time_id, numericality: { other_than: 1, message: "can't be blank" }
end
