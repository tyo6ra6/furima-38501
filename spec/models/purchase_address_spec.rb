require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do

describe '商品購入' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id )
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では購入できない' do
      @purchase_address.post_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeは、「3桁ハイフン4桁」の半角文字列のみ購入可能' do
      @purchase_address.post_code = '1234-1234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと購入できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空では購入できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では購入できない' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'numberが空では購入できない' do
      @purchase_address.number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Number can't be blank", "Number is invalid.")
    end
    it 'numberが9桁以下だと購入できない' do
      @purchase_address.number = '12345'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Number is invalid.")
    end
    it 'numberが12桁以上だと購入できない' do
      @purchase_address.number = '123456789101112'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Number is invalid.")
    end
    it 'numberに半角数字以外が含まれている場合は購入できない' do
      @purchase_address.number = 'あああ'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Number is invalid.")
    end
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
end


















