require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'item_nameとcategory_id,condition_idとtext,priceとshipping_payer_id,area_idとtake_time_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textが空では保存できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it 'priceが¥299円以下でないと保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it 'priceが10000000円以上だと保存できない' do
        @item.price = '1000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it 'price半角数字以外が含まれている場合は出品できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("金額は ¥300~9,999,999 の間で半角数字で指定してください")
      end
      it '紐づくユーザーが存在しないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'category_idが空だと保存できない  ' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idが空だと保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("状態を選択したください")
      end
      it 'shipping_payer_idが体と保存できない' do
        @item.shipping_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("送料負担者を選択してください")
      end
      it 'area_idが空だと保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元を選択してください")
      end
      it 'take_time_idが空だと保存できない' do
        @item.take_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'category_idに「---」が選択されている場合は出品できない' do
        @item.category_id = '「---」'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idに「---」が選択されている場合は出品できない' do
        @item.category_id = '「---」'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'shipping_payer_idに「---」が選択されている場合は出品できない' do
        @item.category_id = '「---」'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'area_idに「---」が選択されている場合は出品できない' do
        @item.category_id = '「---」'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'take_time_idに「---」が選択されている場合は出品できない' do
        @item.category_id = '「---」」'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
    end
  end
end
