require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品の出品ができる場合' do
      it '必要な項目が入力されて入れば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it '商品のカテゴリーが未選択では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品のカテゴリーが1の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態が未選択では出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '商品の状態が1の場合は出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
      end
      it '配送料の負担が未選択では出品できない' do
        @item.shipping_price_responsibility_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price responsibility can't be blank")
      end
      it '配送料の負担が1の場合は出品できない' do
        @item.shipping_price_responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price responsibility must be other than 1")
      end
      it '発送元の地域が未選択では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域が1の場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数が未選択では出品できない' do
        @item.shipping_date_forecast_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date forecast can't be blank")
      end
      it '発送までの日数が1の場合は出品できない' do
        @item.shipping_date_forecast_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date forecast must be other than 1")
      end
      it '販売価格が空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '販売価格が￥300~￥9,999,999の間でなければは出品できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it '販売価格が10_000_000円以上の場合は出品できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it '販売価格が半角数字でなければ出品できない' do
        @item.item_price = '４４４４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price には半角数値を使用してください")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
