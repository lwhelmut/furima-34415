require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailに@がなければ登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '0000a'
      @user.password_confirmation = '0000a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '苗字が空では登録できない' do
      @user.sir_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sir name can't be blank")
    end
    it '苗字が全角でなければ登録できない' do
      @user.sir_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Sir name には全角文字を使用してください")
    end
    it '名前が空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it '名前が全角でなければ登録できない' do
      @user.name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name には全角文字を使用してください")
    end
    it '苗字（カナ）が空では登録できない' do
      @user.sir_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sir name reading can't be blank")
    end
    it '苗字（カナ）がカタカナでなければ登録できない' do
      @user.sir_name_reading = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Sir name reading にはカタカナを使用してください")
    end
    it '名前（カナ）が空では登録できない' do
      @user.name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading can't be blank")
    end
    it '名前（カナ）がカタカナでなければ登録できない' do
      @user.name_reading = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name reading にはカタカナを使用してください")
    end
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end