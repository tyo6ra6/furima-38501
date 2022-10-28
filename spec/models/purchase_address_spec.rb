require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号にハイフンを含めてください")
      end
      it 'post_codeは、「3桁ハイフン4桁」の半角文字列のみ購入可能' do
        @purchase_address.post_code = '1234-1234'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号にハイフンを含めてください")
      end
      it 'prefectureを選択していないと購入できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空では購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'numberが空では購入できない' do
        @purchase_address.number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は10〜11桁以内にしてください")
      end
      it 'numberが9桁以下だと購入できない' do
        @purchase_address.number = '12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10〜11桁以内にしてください")
      end
      it 'numberが12桁以上だと購入できない' do
        @purchase_address.number = '123456789101112'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10〜11桁以内にしてください")
      end
      it 'numberに半角数字以外が含まれている場合は購入できない' do
        @purchase_address.number = 'あああ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は10〜11桁以内にしてください")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'userが紐付いていないと購入できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
