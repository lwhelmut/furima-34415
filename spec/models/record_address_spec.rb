require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入者の情報保存' do
    before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
    end

    context '購入者情報の保存ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @record_address.building_name = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入者情報の保存ができる場合' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @record_address.house_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁でないと保存できないこと' do
        @record_address.phone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number must be 11 figures")
      end
      it 'phone_numberが半角数字でないと保存できないこと' do
        @record_address.phone_number = '０９０９９９９３３３３'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number available only with numeric characters")
      end
      it "tokenが空では登録できないこと" do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
