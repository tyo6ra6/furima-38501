class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :number, :user_id, :endpurchase_id, :item_id


  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :number,    format: {with: /\A\d{10,11}\z/ , message: "is invalid."}
    validates :house_number
  end

    def save
      # 購入情報を保存し、変数purchaseに代入する
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      # 住所を保存する
      # purchase_idには、変数purchaseのidと指定する
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, number: number,  purchase_id: purchase.id)
    end
  end
  

