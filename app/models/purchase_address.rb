class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :number, :user_id, :purchase_id, :item_id,
                :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'にハイフンを含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください'} 
    validates :city
    validates :number, format: { with: /\A\d{10,11}\z/, message: 'は10〜11桁以内にしてください' }
    validates :house_number
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_idには、変数purchaseのidと指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, number: number, purchase_id: purchase.id)
  end
end
